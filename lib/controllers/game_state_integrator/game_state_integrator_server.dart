import 'dart:io';
import 'dart:convert' as convert;

typedef SubscribeFn = void Function(Map<String, dynamic>);

class GameStateIntegratorServer {
  final List<SubscribeFn> _listeners = [];
  late HttpServer _server;

  GameStateIntegratorServer();

  get server => _server;

  void Function() subscribe(SubscribeFn subscriber) {
    _listeners.add(subscriber);

    return () {
      _listeners.remove(subscriber);
    };
  }

  Future<void> listen({int? port}) async {
    _server = await HttpServer.bind(InternetAddress.loopbackIPv4, port ?? 9000);

    _server.listen((HttpRequest req) async {
      final bool isPost = req.method == 'POST';
      final res = req.response;

      if (isPost) {
        final Map<String, dynamic>? response = await _toJson(req);

        if (response != null) {
          for (var fn in _listeners) {
            fn(response);
          }
        }
      }

      res.write('');
      res.close();
    });
  }

  _toJson(HttpRequest req) async {
      final contentType = req.headers.contentType;
      late Map<String, dynamic>? body;
      final bool isJson = contentType != null && contentType.mimeType == 'application/json';

      if (isJson) {
        final content = await convert.utf8.decoder.bind(req).join();

        body = convert.jsonDecode(content) as Map<String, dynamic>;
      } else {
        body = null;
      }

      return body;
  }
}
