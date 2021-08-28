import 'dart:io';

import 'package:path_provider/path_provider.dart';

const String fileName = 'dota-directory.store';

class DotaDirectory {
  final Future<Directory> _appDocumentsDirectory =
      getApplicationSupportDirectory();

  Future<File> _getFile() async {
    final Directory directory = await _appDocumentsDirectory;

    return File('${directory.path}/$fileName');
  }

  Future<String?> getDotaDirectory() async {
    String? directory;

    try {
      final file = await _getFile();
      directory = await file.readAsString();
    } catch (_) {}

    return directory;
  }

  Future<void> setDotaDirectory({required String path}) async {
    final file = await _getFile();

    file.writeAsString(path);
  }
}
