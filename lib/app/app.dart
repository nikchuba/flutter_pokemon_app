import 'package:flutter/material.dart';

import '../constants.dart';
import 'pages/main_page.dart';
import 'pages/search_page.dart';
import 'pages/random_pokemon_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.dark,
          centerTitle: true,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainPage(),
        '/search': (context) => const SearchPage(),
        '/random_pokemon': (context) => const RandomPokemonPage()
      },
    );
  }
}
