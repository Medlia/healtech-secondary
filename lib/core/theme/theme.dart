import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      indicatorColor: Colors.black.withOpacity(0.1),
      surfaceTintColor: Colors.white,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      dayStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.black.withOpacity(0.4),
      ),
      weekdayStyle: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      yearStyle: TextStyle(
        fontSize: 16.0,
        color: Colors.black.withOpacity(0.4),
      ),
      todayBackgroundColor: WidgetStatePropertyAll(
        Colors.black.withOpacity(0.8),
      ),
      rangePickerShape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
    ),
  );
}
