import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class Dota {
  static gsiInitial() async {
    String? fileName = 'gamestate_integration_dota2checker.cfg';
    String? directory = await getDirectory();

    if (directory != null) {
      final path = '$directory/dota/cfg/gamestate_integration/$fileName';
      final file = File(path);

      try {
        await file.readAsString();
      } catch (_) {
        final cfg = await rootBundle.loadString('assets/$fileName');
        file.writeAsString(cfg);
      }
    }
  }

  static Future<String?> getDirectory() async {
    final result = await Process.run('REG', ['QUERY', 'HKEY_CLASSES_ROOT\\dota2\\Shell\\Open\\Command\\']);
    final String out = result.stdout;
    String? directory;

    if (out.contains('dota2.exe')) {
      final match = RegExp('(?<=["\'])[^"\']+').allMatches(out).first[0];

      if (match != null) {
        directory = match.substring(0, match.indexOf('\\bin'));
      }
    }

    return directory;
  }
}


