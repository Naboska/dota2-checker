import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../utils/dota_directory.dart';

class SettingsScreen extends StatelessWidget {
  final Future<void> Function() reInitialize;
  final _dotaDirectory = DotaDirectory();

  SettingsScreen({Key? key, required this.reInitialize}) : super(key: key);

  Future<void> _setDotaPath() async {
    String? result = await FilePicker.platform.getDirectoryPath();

    if (result != null) {
      await _dotaDirectory.setDotaDirectory(path: result);
    }

    reInitialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dota 2 Checker'),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Перед началом использования необходимо указать папку с игрой dota2',
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: ElevatedButton(
                    child: const Text('Указать'),
                    onPressed: _setDotaPath,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
