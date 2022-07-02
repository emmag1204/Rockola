import 'package:flutter/material.dart';
import 'package:rockola/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class RockolaThemes {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData.dark().copyWith(
      primaryColor: RockolaColors.primaryOrange,
      scaffoldBackgroundColor: RockolaColors.primaryBackground,
      textTheme: GoogleFonts.robotoTextTheme(
        Theme.of(context).textTheme,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: RockolaColors.primaryPurple,
          minimumSize: const Size(double.infinity, 70),
          onPrimary: RockolaColors.primaryOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: RockolaColors.primaryOrange),
      ),
    );
  }
}
