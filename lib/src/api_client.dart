import 'dart:io';
import 'package:http/http.dart';
import 'package:http/io_client.dart' as http;

class APIClient {
  http.IOClient getProxyAPIClient() {
    final httpClient = HttpClient();

    httpClient.findProxy = (Uri uri) {
      return "PROXY 35.185.196.38:3128";
    };

    httpClient.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;

    return http.IOClient(httpClient);
  }

  http.IOClient getAPIClient() {
    final httpClient = HttpClient();

    return http.IOClient(httpClient);
  }

  Future<Response> getRequest(
      {required http.IOClient ioClient,
      required String url,
      Map<String, String>? headers}) async {
    try {
      return await ioClient.get(Uri.parse(url), headers: headers);
    } catch (e) {
      print(e);
      if (e.runtimeType.toString() == "_ClientSocketException") {
        final exception = e as SocketException;
        if (exception.osError?.errorCode == 1225) {
          return getRequest(ioClient: getProxyAPIClient(), url: url);
        } else {
          return Response("Unknown Error Occurrred", 520);
        }
      } else {
        return Response("Unknown Error Occurrred", 520);
      }
    } finally {
      ioClient.close();
    }
  }
}
