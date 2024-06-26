import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(237, 87, 126, 165),
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
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(
        Colors.white,
      ),
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
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor:
          WidgetStatePropertyAll(Color.fromARGB(237, 87, 126, 165)),
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
  dividerTheme:
      const DividerThemeData(color: Color.fromARGB(237, 87, 126, 165)),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: Color.fromARGB(237, 87, 126, 165),
    indicatorColor: Colors.white70,
  ),
);
