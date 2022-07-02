import 'package:flutter/material.dart';
import 'package:rockola/constants/colors.dart';

class RockolaThemes {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: RockolaColors.primaryOrange,
      scaffoldBackgroundColor: Color(0xFF030303),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: RockolaColors.primaryPurple,
          minimumSize: Size(double.infinity, 70),
        ),
      ),
    );
  }
}
