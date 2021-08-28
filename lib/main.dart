import 'package:flutter/material.dart';

import 'screens/home_screen/home_screen.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  final ThemeData theme = ThemeData.dark();

  Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dota 2 Checker',
      theme: theme,
      home: HomeScreen(),
    );
  }
}
