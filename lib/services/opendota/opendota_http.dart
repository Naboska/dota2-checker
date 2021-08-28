import 'package:http/http.dart' as http;

class OpenDotaHttp {
  final String _openDotaUrl = 'https://api.opendota.com/api';

  Future<http.Response> getRequest(String href) => http.get(Uri.parse('$_openDotaUrl$href'));
}