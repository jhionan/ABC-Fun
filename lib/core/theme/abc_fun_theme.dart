import 'package:aba/core/theme/abc_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AbcTheme {
  ThemeData theme(Brightness brightness) {
    switch (brightness) {
      case Brightness.dark:
        return darkTheme();

      case Brightness.light:
      default:
        return lightTheme();
    }
  }

  ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      dividerColor: AbcColors.dropShadow,
      colorScheme: const ColorScheme(
        primary: AbcColors.primary,
        background: AbcColors.background,
        brightness: Brightness.light,
        error: AbcColors.error,
        onBackground: AbcColors.onBackground,
        onError: AbcColors.onError,
        onPrimary: AbcColors.onPrimary,
        onSecondary: AbcColors.onSecondary,
        onSurface: AbcColors.onSurface,
        secondary: AbcColors.secondary,
        surface: AbcColors.surface,
        shadow: AbcColors.dropShadow,
      ),
      textTheme: GoogleFonts.interTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200),
        ),
        fillColor: Colors.white,
        filled: true,
        hintStyle: GoogleFonts.inter(
          color: AbcColors.hintText,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  ThemeData darkTheme() {
    return lightTheme();
  }
}
