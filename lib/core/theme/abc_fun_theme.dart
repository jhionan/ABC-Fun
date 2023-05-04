import 'package:aba/core/theme/abc_fun_colors.dart';
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
      colorScheme: const ColorScheme(
        primary: AbcFunColors.primary,
        background: AbcFunColors.background,
        brightness: Brightness.light,
        error: AbcFunColors.error,
        onBackground: AbcFunColors.onBackground,
        onError: AbcFunColors.onError,
        onPrimary: AbcFunColors.onPrimary,
        onSecondary: AbcFunColors.onSecondary,
        onSurface: AbcFunColors.onSurface,
        secondary: AbcFunColors.secondary,
        surface: AbcFunColors.surface,
      ),
      textTheme: GoogleFonts.interTextTheme(),
    );
  }

  ThemeData darkTheme() {
    return lightTheme();
  }
}
