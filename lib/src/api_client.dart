import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart' as http;

class APIClient {
  http.IOClient getAPIClient() {
    final httpClient = HttpClient();

    // httpClient.findProxy = (Uri uri) {
    //   return "PROXY 35.185.196.38:3128";
    // };

    // httpClient.badCertificateCallback =
    //     (X509Certificate cert, String host, int port) => true;

    return http.IOClient(httpClient);
  }

  Future<Response> getRequest(String url) async {
    final apiClient = getAPIClient();

    try {
      return await apiClient.get(Uri.parse(url));
    } catch (e, s) {
      print(e);
      print(s);
      return Response("error", 1);
    } finally {
      apiClient.close();
    }
  }
}
