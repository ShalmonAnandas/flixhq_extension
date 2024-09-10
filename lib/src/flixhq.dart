import 'dart:convert';
import 'dart:developer';

import 'package:flixhq_extension/src/api_client.dart';
import 'package:flixhq_extension/src/enums.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

class FlixHq {
  final APIClient apiClient = APIClient();

  Future<Map<String, dynamic>?> getLandingPage() async {
    final response = await apiClient.getRequest(
        ioClient: apiClient.getAPIClient(), url: "https://flixhq.to/home");

    if (response.statusCode == 200) {
      final document = parser.parse(response.body);

      Map<String, dynamic> landingPageData = {};

      final trendingMovies =
          parser.parse(document.getElementById("trending-movies")?.innerHtml);
      landingPageData["trending_movies"] = extractMediaFromList(trendingMovies);

      final trendingShows =
          parser.parse(document.getElementById("trending-tv")?.innerHtml);
      landingPageData["trending_shows"] = extractMediaFromList(trendingShows);

      final latestMovies = parser
          .parse(document.getElementsByClassName("section-id-02")[0].innerHtml);
      landingPageData["latest_movies"] = extractMediaFromList(latestMovies);

      final latestShows = parser
          .parse(document.getElementsByClassName("section-id-02")[1].innerHtml);
      landingPageData["latest_shows"] = extractMediaFromList(latestShows);

      final comingSoon = parser
          .parse(document.getElementsByClassName("section-id-02")[2].innerHtml);
      landingPageData["coming_soon"] = extractMediaFromList(comingSoon);

      return landingPageData;
    } else {
      log("Error Code :: ${response.statusCode}",
          name: "GetLandingPageAPIError");
      log("Error Message :: ${response.body}", name: "GetLandingPageAPIError");
      return null;
    }
  }

  void getMediaDetails(String url, MediaType mediaType) async {
    final response = await apiClient.getRequest(
      ioClient: apiClient.getAPIClient(),
      url: url,
    );

    if (response.statusCode == 200) {
      final document = parser.parse(response.body);

      Map<String, dynamic> mediaDetails = {};

      mediaDetails["title"] =
          document.getElementsByClassName("heading-name")[0].text;
      mediaDetails["description"] =
          document.getElementsByClassName("description")[0].text.trim();
      mediaDetails["backdrop_url"] =
          document.head?.children[19].attributes["content"];

      final elementList = document.getElementsByClassName("row-line");
      mediaDetails["country"] = elementList[0].text.split(":")[1].trim();
      mediaDetails["genre"] = {
        elementList[1]
            .text
            .split(":")[1]
            .trim()
            .split(",")
            .map((e) => e.trim())
            .toList()
      };
      mediaDetails["released"] = elementList[2].text.split(":")[1].trim();
      mediaDetails["production"] = elementList[3].text.split(":")[1].trim();
      mediaDetails["cast"] = elementList[4]
          .text
          .split(":")[1]
          .trim()
          .split(",")
          .map((e) => e.trim())
          .toList();

      final relatedDocument = parser
          .parse(document.getElementsByClassName("m_i-related")[0].innerHtml);

      mediaDetails["related"] = extractMediaFromList(relatedDocument);

      if (mediaType == MediaType.tv) {
        String id = url.split("-").last;

        final seasonResponse = await apiClient.getRequest(
            ioClient: apiClient.getAPIClient(),
            url: "https://flixhq.to/ajax/v2/tv/seasons/$id");

        List<Map<String?, String>> seasonMap = parser
            .parse(seasonResponse.body)
            .getElementsByClassName("ss-item")
            .map((e) => {e.attributes["data-id"]: e.text})
            .toList();

        final seasonList = [];

        for (Map<String?, dynamic> season in seasonMap) {
          final episodeResponse = await apiClient.getRequest(
              ioClient: apiClient.getAPIClient(),
              url:
                  "https://flixhq.to/ajax/v2/season/episodes/${season.keys.first}");

          final episodeIdList = parser
              .parse(episodeResponse.body)
              .getElementsByClassName("eps-item")
              .map(
                  (e) => {"id": e.attributes["data-id"], "name": e.text.trim()})
              .toList();

          seasonList
              .add({"season": season.values.first, "episodes": episodeIdList});
        }

        mediaDetails["seasons"] = seasonList;
      }

      print(mediaDetails);
    } else {
      log("Error Code :: ${response.statusCode}",
          name: "GetMediaDetailsAPIError");
      log("Error Message :: ${response.body}", name: "GetMediaDetailsAPIError");
      return;
    }
  }

  List<Map<String, dynamic>> extractMediaFromList(Document doc) {
    List<Map<String, dynamic>> dataList = [];

    doc.getElementsByClassName("flw-item").forEach((element) {
      Map<String, dynamic> dataMap = {};
      String mediaType = "";

      Document data = parser.parse(element.innerHtml);
      dataMap["title"] =
          data.getElementsByClassName("film-name")[0].text.trim();
      dataMap["poster-url"] = data
          .getElementsByClassName("film-poster-img")[0]
          .attributes["data-src"];
      dataMap["watch-url"] =
          "https://flixhq.to${data.getElementsByClassName("film-poster-ahref")[0].attributes["href"]}";
      dataMap["mediaType"] =
          mediaType = data.getElementsByClassName("fdi-type")[0].text.trim();

      if (mediaType.toLowerCase() == "tv" &&
          data.getElementsByClassName("fdi-item").length > 1) {
        dataMap["seasons"] =
            data.getElementsByClassName("fdi-item")[0].text.trim();
        dataMap["episodes"] =
            data.getElementsByClassName("fdi-item")[1].text.trim();
      } else if (mediaType.toLowerCase() == "movie" &&
          data.getElementsByClassName("fdi-duration").isNotEmpty) {
        dataMap["duration"] =
            data.getElementsByClassName("fdi-duration")[0].text.trim();
      }

      dataList.add(dataMap);
    });

    return dataList;
  }

  void fetchServers(String episodeID, MediaType mediaType) async {
    final response = await apiClient.getRequest(
        ioClient: apiClient.getAPIClient(),
        url: mediaType == MediaType.tv
            ? "https://flixhq.to/ajax/v2/episode/servers/$episodeID"
            : "https://flixhq.to/ajax/movie/episodes/$episodeID");

    final serverList = parser
        .parse(response.body)
        .getElementsByClassName("link-item")
        .map((e) => {
              "server_name": e.text.trim(),
              "server_id": e.attributes["data-id"]
            })
        .toList();

    print(serverList);

    fetchStremingLinks(serverList[1]["server_id"]!);
  }

  void fetchStremingLinks(String serverID) async {
    final response = await apiClient.getRequest(
        ioClient: apiClient.getAPIClient(),
        url: "https://flixhq.to/ajax/get_link/$serverID");

    String url = json.decode(response.body)["link"];

    String id = url.split("/").last.split("?")[0];

    final streamingLinks = await apiClient.getRequest(
        ioClient: apiClient.getAPIClient(),
        url: "https://flixhq.to/ajax/get_link/$id",
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          "Referer": url,
          'User-Agent':
              "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36",
        });

    print(streamingLinks.body);
  }
}
