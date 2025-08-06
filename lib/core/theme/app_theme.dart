// core/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand colors
  static const Color primaryPink = Color(0xFFFF006E);

  // Light theme colors
  static const Color lightBackground = Color(0xFFFAFAFA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF5F5F5);
  static const Color lightOnBackground = Color(0xFF1A1A1A);
  static const Color lightOnSurface = Color(0xFF2A2A2A);
  static const Color lightSecondaryText = Color(0xFF666666);

  // Dark theme colors
  static const Color darkBackground = Color(0xFF0A0A0A);
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color darkSurfaceVariant = Color(0xFF2A2A2A);
  static const Color darkOnBackground = Color(0xFFFFFFFF);
  static const Color darkOnSurface = Color(0xFFE0E0E0);
  static const Color darkSecondaryText = Color(0xFF999999);

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: primaryPink,
        secondary: primaryPink,
        surface: lightSurface,
        surfaceVariant: lightSurfaceVariant,
        background: lightBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: lightOnSurface,
        onBackground: lightOnBackground,
      ),
      textTheme: GoogleFonts.dmSansTextTheme(ThemeData.light().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.dmSans(color: lightOnBackground),
            displayMedium: GoogleFonts.dmSans(color: lightOnBackground),
            displaySmall: GoogleFonts.dmSans(color: lightOnBackground),
            headlineLarge: GoogleFonts.dmSans(color: lightOnBackground),
            headlineMedium: GoogleFonts.dmSans(color: lightOnBackground),
            headlineSmall: GoogleFonts.dmSans(color: lightOnBackground),
            titleLarge: GoogleFonts.dmSans(color: lightOnBackground),
            titleMedium: GoogleFonts.dmSans(color: lightOnBackground),
            titleSmall: GoogleFonts.dmSans(color: lightOnBackground),
            bodyLarge: GoogleFonts.dmSans(color: lightSecondaryText),
            bodyMedium: GoogleFonts.dmSans(color: lightSecondaryText),
            bodySmall: GoogleFonts.dmSans(color: lightSecondaryText),
            labelLarge: GoogleFonts.dmSans(color: lightSecondaryText),
            labelMedium: GoogleFonts.dmSans(color: lightSecondaryText),
            labelSmall: GoogleFonts.dmSans(color: lightSecondaryText),
          ),
      scaffoldBackgroundColor: lightBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: lightSurface,
        foregroundColor: lightOnBackground,
        elevation: 0,
        scrolledUnderElevation: 1,
        shadowColor: Colors.black12,
      ),
      cardTheme: const CardThemeData(
        color: lightSurface,
        shadowColor: Colors.black12,
        elevation: 2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPink,
          foregroundColor: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(color: lightOnSurface),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: primaryPink,
        secondary: primaryPink,
        surface: darkSurface,
        surfaceVariant: darkSurfaceVariant,
        background: darkBackground,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: darkOnSurface,
        onBackground: darkOnBackground,
      ),
      textTheme: GoogleFonts.dmSansTextTheme(ThemeData.dark().textTheme)
          .copyWith(
            displayLarge: GoogleFonts.dmSans(color: darkOnBackground),
            displayMedium: GoogleFonts.dmSans(color: darkOnBackground),
            displaySmall: GoogleFonts.dmSans(color: darkOnBackground),
            headlineLarge: GoogleFonts.dmSans(color: darkOnBackground),
            headlineMedium: GoogleFonts.dmSans(color: darkOnBackground),
            headlineSmall: GoogleFonts.dmSans(color: darkOnBackground),
            titleLarge: GoogleFonts.dmSans(color: darkOnBackground),
            titleMedium: GoogleFonts.dmSans(color: darkOnBackground),
            titleSmall: GoogleFonts.dmSans(color: darkOnBackground),
            bodyLarge: GoogleFonts.dmSans(color: darkSecondaryText),
            bodyMedium: GoogleFonts.dmSans(color: darkSecondaryText),
            bodySmall: GoogleFonts.dmSans(color: darkSecondaryText),
            labelLarge: GoogleFonts.dmSans(color: darkSecondaryText),
            labelMedium: GoogleFonts.dmSans(color: darkSecondaryText),
            labelSmall: GoogleFonts.dmSans(color: darkSecondaryText),
          ),
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: darkOnBackground,
        elevation: 0,
      ),
      cardTheme: const CardThemeData(
        color: darkSurface,
        shadowColor: Colors.black54,
        elevation: 4,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryPink,
          foregroundColor: Colors.white,
        ),
      ),
      iconTheme: IconThemeData(color: darkOnSurface),
    );
  }

  // Helper methods to get colors based on current theme
  static Color getBackgroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightBackground
        : darkBackground;
  }

  static Color getSurfaceColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightSurface
        : darkSurface;
  }

  static Color getSurfaceVariantColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightSurfaceVariant
        : darkSurfaceVariant;
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightOnBackground
        : darkOnBackground;
  }

  static Color getSecondaryTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightSecondaryText
        : darkSecondaryText;
  }
}
