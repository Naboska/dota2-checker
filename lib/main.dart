import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/home_screen/home_screen.dart';
import 'screens/player_screen/player_screen.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  final ThemeData theme = ThemeData.dark();

  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dota 2 Checker',
      theme: theme,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(
            name: '/player/:playerId',
            page: () => PlayerScreen(),
            transition: Transition.fadeIn),
      ],
    );
  }
}
