import 'package:flixhq_extension/flixhq_extension.dart';
import 'package:flixhq_extension/src/api_client.dart';
import 'package:flixhq_extension/src/enums.dart';

void main() {
  // FlixHq().getLandingPage(APIClient().getAPIClient());
  FlixHq().fetchServers("973427", MediaType.tv);
}
