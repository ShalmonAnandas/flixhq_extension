import 'package:flixhq_extension/src/api_client.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

class FlixHq {
  final APIClient apiClient = APIClient();

  Future<Map<String, dynamic>> getLandingPage() async {
    final response = await apiClient.getRequest("https://flixhq.to/home");
    final document = parser.parse(response.body);

    Map<String, dynamic> landingPageData = {};

    final trendingMovies =
        parser.parse(document.getElementById("trending-movies")?.innerHtml);
    landingPageData["trending_movies"] = exractLandingPageData(trendingMovies);

    final trendingShows =
        parser.parse(document.getElementById("trending-tv")?.innerHtml);
    landingPageData["trending_shows"] = exractLandingPageData(trendingShows);

    final latestMovies = parser
        .parse(document.getElementsByClassName("section-id-02")[0].innerHtml);
    landingPageData["latest_movies"] = exractLandingPageData(latestMovies);

    final latestShows = parser
        .parse(document.getElementsByClassName("section-id-02")[1].innerHtml);
    landingPageData["latest_shows"] = exractLandingPageData(latestShows);

    final comingSoon = parser
        .parse(document.getElementsByClassName("section-id-02")[2].innerHtml);
    landingPageData["coming_soon"] = exractLandingPageData(comingSoon);

    print(landingPageData);

    return landingPageData;
  }

  void getMediaDetails(String url) async {
    final response = await apiClient.getRequest(url);
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

    mediaDetails["related"] = exractLandingPageData(relatedDocument);

    print(mediaDetails);
  }

  List<Map<String, dynamic>> exractLandingPageData(Document doc) {
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
}
