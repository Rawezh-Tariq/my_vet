import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.blueAccent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 30,
      color: Color.fromARGB(237, 87, 126, 165),
    ),
    titleMedium: TextStyle(
      fontSize: 24,
      color: Color.fromARGB(237, 87, 126, 165),
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Color.fromARGB(237, 87, 126, 165),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    suffixIconColor: Color.fromARGB(237, 87, 126, 165),
    hintStyle: TextStyle(
      color: Color.fromARGB(237, 87, 126, 165),
      fontSize: 16,
    ),
  ),
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor:
          WidgetStatePropertyAll(Color.fromARGB(237, 87, 126, 165)),
    ),
  ),
);
