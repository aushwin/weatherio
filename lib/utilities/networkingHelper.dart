import 'package:weatherio/utilities/location.dart';
import 'package:http/http.dart' as http;
import 'package:weatherio/screens/weatherScreen.dart';
import 'package:weatherio/utilities/constants.dart';

class NetworkingHelper {
  NetworkingHelper({this.url});
  final String url;

  Future<http.Response> getData() async {
    http.Response response = await http.get(url);
    return response;
  }
}
