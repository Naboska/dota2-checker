import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


import 'controllers/game-state-integrator/game_state_integrator.dart';
import 'screens/home_screen/home_screen.dart';
import 'screens/player_screen/player_screen.dart';
import 'utils/dota.dart';

void main() async {
  await initHiveForFlutter();
  await Dota.gsiInitial();

  final HttpLink httpLink = HttpLink(
    'https://api.stratz.com/graphql',
  );

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(ChangeNotifierProvider(
    create: (context) => GSIController(),
    child: GraphQLProvider(
      client: client,
      child: Root(),
    )
  ));
}

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
