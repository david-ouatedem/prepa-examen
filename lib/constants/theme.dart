import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF6BF042),
    onPrimary: Color(0xFF131811),
    secondary: Color(0xFF2C3928),
    onSecondary: Color(0xFF9FB599),
    surface: Color(0xFF2C3928),
    onSurface: Color(0xFF9FB599),
    error: Color(0xFFE53935),
    onError: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: const Color(0xFF131811),
  // replaces deprecated background
  cardColor: const Color(0xFF2C3928),
  // replaces surface usage for cards
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color(0xFF9FB599)), // replaces onBackground
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: const Color(0xFF2C3928), // or Color(0xFF131811)
    indicatorColor: const Color(0xFF6BF042),
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: Color(0xFF9FB599)),
    ),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(
          color: Color(0xFF131811),
        ); // Selected icon color
      }
      return const IconThemeData(
        color: Color(0xFF9FB599),
      ); // Unselected icon color
    }),
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6BF042),
    onPrimary: Color(0xFF131811),
    secondary: Color(0xFF2C3928),
    onSecondary: Color(0xFFFFFFFF),
    surface: Color(0xFFF5F5F5),
    onSurface: Color(0xFF131811),
    error: Color(0xFFD32F2F),
    onError: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: Colors.white,
  // replaces deprecated background
  cardColor: const Color(0xFFF5F5F5),
  // replaces surface usage for cards
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Color(0xFF131811)), // replaces onBackground
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.white,
    indicatorColor: const Color(0xFF6BF042),
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: Color(0xFF131811)),
    ),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(
          color: Color(0xFF131811),
        ); // Selected icon color
      }
      return const IconThemeData(
        color: Color(0xFF131811),
      ); // Unselected icon color
    }),
  ),
);
