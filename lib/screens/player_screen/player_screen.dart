import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerScreen extends StatelessWidget {
  final playerId = Get.parameters['playerId'] as String;

  PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Информация по игроку с id: $playerId'),
        ),
        resizeToAvoidBottomInset: false,
        body: const SingleChildScrollView(child: Text('nextTime')));
  }
}
