import 'package:http/http.dart' as http;

class OpenDotaHttp {
  String openDotaUrl = 'https://api.opendota.com/api';

  Future<http.Response> getRequest(String href) => http.get(Uri.parse('$openDotaUrl$href'));
}