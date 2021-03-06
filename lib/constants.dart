import 'dart:math';

import 'package:flutter/material.dart';

class AppColors {
  static const Color dark = Color.fromARGB(255, 51, 54, 58);
  static const Color background = Color.fromARGB(255, 130, 130, 130);
  static const Color red = Color.fromARGB(255, 251, 63, 63);
  static const Color yellow = Color.fromARGB(255, 255, 212, 0);
  static const Color white = Colors.white;
}

int getRandomInt(int min, int max) {
  int randomNumber = Random().nextInt(max) + min;
  return randomNumber;
}

Map<String, String> texts = {
  'searchPage': 'Pokemon search page',
  'randomPage': 'Random Pokemon page',
  'searchBtn': 'Search',
  'randomBtn': 'Random',
  'searchHint': 'Enter name of Pokemon'
};
