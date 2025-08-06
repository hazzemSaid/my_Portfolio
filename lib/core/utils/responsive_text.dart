// core/utils/responsive_text.dart
import 'package:flutter/material.dart';

class ResponsiveText {
  // Get responsive font size based on screen width and text type
  static double getResponsiveFontSize(BuildContext context, TextType textType) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 480) {
      // Extra small mobile
      return _getExtraSmallFontSize(textType);
    } else if (screenWidth < 768) {
      // Mobile
      return _getMobileFontSize(textType);
    } else if (screenWidth < 1024) {
      // Tablet
      return _getTabletFontSize(textType);
    } else if (screenWidth < 1440) {
      // Desktop
      return _getDesktopFontSize(textType);
    } else {
      // Large desktop
      return _getLargeDesktopFontSize(textType);
    }
  }

  // Get responsive line height based on text type
  static double getResponsiveLineHeight(TextType textType) {
    switch (textType) {
      case TextType.displayLarge:
      case TextType.displayMedium:
      case TextType.displaySmall:
      case TextType.headlineLarge:
      case TextType.headlineMedium:
        return 1.2;
      case TextType.headlineSmall:
      case TextType.titleLarge:
      case TextType.titleMedium:
        return 1.3;
      case TextType.titleSmall:
      case TextType.bodyLarge:
      case TextType.bodyMedium:
      case TextType.bodySmall:
        return 1.5;
      case TextType.labelLarge:
      case TextType.labelMedium:
      case TextType.labelSmall:
        return 1.4;
    }
  }

  // Get responsive letter spacing
  static double getResponsiveLetterSpacing(TextType textType) {
    switch (textType) {
      case TextType.displayLarge:
      case TextType.displayMedium:
      case TextType.displaySmall:
        return -0.25;
      case TextType.headlineLarge:
      case TextType.headlineMedium:
      case TextType.headlineSmall:
        return 0;
      case TextType.titleLarge:
      case TextType.titleMedium:
      case TextType.titleSmall:
        return 0.15;
      case TextType.bodyLarge:
      case TextType.bodyMedium:
      case TextType.bodySmall:
        return 0.25;
      case TextType.labelLarge:
      case TextType.labelMedium:
      case TextType.labelSmall:
        return 0.5;
    }
  }

  // Create responsive TextStyle
  static TextStyle getResponsiveTextStyle(
    BuildContext context,
    TextType textType, {
    Color? color,
    FontWeight? fontWeight,
    double? customFontSize,
    double? customLineHeight,
    double? customLetterSpacing,
  }) {
    return TextStyle(
      fontSize: customFontSize ?? getResponsiveFontSize(context, textType),
      height: customLineHeight ?? getResponsiveLineHeight(textType),
      letterSpacing:
          customLetterSpacing ?? getResponsiveLetterSpacing(textType),
      color: color,
      fontWeight: fontWeight,
    );
  }

  // Extra small mobile (< 480px)
  static double _getExtraSmallFontSize(TextType textType) {
    switch (textType) {
      case TextType.displayLarge:
        return 40;
      case TextType.displayMedium:
        return 36;
      case TextType.displaySmall:
        return 32;
      case TextType.headlineLarge:
        return 28;
      case TextType.headlineMedium:
        return 24;
      case TextType.headlineSmall:
        return 20;
      case TextType.titleLarge:
        return 18;
      case TextType.titleMedium:
        return 16;
      case TextType.titleSmall:
        return 14;
      case TextType.bodyLarge:
        return 14;
      case TextType.bodyMedium:
        return 13;
      case TextType.bodySmall:
        return 12;
      case TextType.labelLarge:
        return 12;
      case TextType.labelMedium:
        return 11;
      case TextType.labelSmall:
        return 10;
    }
  }

  // Mobile (480px - 768px)
  static double _getMobileFontSize(TextType textType) {
    switch (textType) {
      case TextType.displayLarge:
        return 48;
      case TextType.displayMedium:
        return 42;
      case TextType.displaySmall:
        return 36;
      case TextType.headlineLarge:
        return 32;
      case TextType.headlineMedium:
        return 28;
      case TextType.headlineSmall:
        return 24;
      case TextType.titleLarge:
        return 20;
      case TextType.titleMedium:
        return 18;
      case TextType.titleSmall:
        return 16;
      case TextType.bodyLarge:
        return 16;
      case TextType.bodyMedium:
        return 14;
      case TextType.bodySmall:
        return 13;
      case TextType.labelLarge:
        return 13;
      case TextType.labelMedium:
        return 12;
      case TextType.labelSmall:
        return 11;
    }
  }

  // Tablet (768px - 1024px)
  static double _getTabletFontSize(TextType textType) {
    switch (textType) {
      case TextType.displayLarge:
        return 56;
      case TextType.displayMedium:
        return 48;
      case TextType.displaySmall:
        return 42;
      case TextType.headlineLarge:
        return 36;
      case TextType.headlineMedium:
        return 32;
      case TextType.headlineSmall:
        return 28;
      case TextType.titleLarge:
        return 22;
      case TextType.titleMedium:
        return 20;
      case TextType.titleSmall:
        return 18;
      case TextType.bodyLarge:
        return 18;
      case TextType.bodyMedium:
        return 16;
      case TextType.bodySmall:
        return 14;
      case TextType.labelLarge:
        return 14;
      case TextType.labelMedium:
        return 13;
      case TextType.labelSmall:
        return 12;
    }
  }

  // Desktop (1024px - 1440px)
  static double _getDesktopFontSize(TextType textType) {
    switch (textType) {
      case TextType.displayLarge:
        return 64;
      case TextType.displayMedium:
        return 56;
      case TextType.displaySmall:
        return 48;
      case TextType.headlineLarge:
        return 40;
      case TextType.headlineMedium:
        return 36;
      case TextType.headlineSmall:
        return 32;
      case TextType.titleLarge:
        return 24;
      case TextType.titleMedium:
        return 22;
      case TextType.titleSmall:
        return 20;
      case TextType.bodyLarge:
        return 18;
      case TextType.bodyMedium:
        return 16;
      case TextType.bodySmall:
        return 14;
      case TextType.labelLarge:
        return 14;
      case TextType.labelMedium:
        return 13;
      case TextType.labelSmall:
        return 12;
    }
  }

  // Large Desktop (> 1440px)
  static double _getLargeDesktopFontSize(TextType textType) {
    switch (textType) {
      case TextType.displayLarge:
        return 72;
      case TextType.displayMedium:
        return 64;
      case TextType.displaySmall:
        return 56;
      case TextType.headlineLarge:
        return 48;
      case TextType.headlineMedium:
        return 40;
      case TextType.headlineSmall:
        return 36;
      case TextType.titleLarge:
        return 28;
      case TextType.titleMedium:
        return 24;
      case TextType.titleSmall:
        return 22;
      case TextType.bodyLarge:
        return 20;
      case TextType.bodyMedium:
        return 18;
      case TextType.bodySmall:
        return 16;
      case TextType.labelLarge:
        return 16;
      case TextType.labelMedium:
        return 14;
      case TextType.labelSmall:
        return 13;
    }
  }
}

// Text type enum for semantic text styling
enum TextType {
  displayLarge, // Largest display text (hero titles)
  displayMedium, // Medium display text
  displaySmall, // Small display text
  headlineLarge, // Large headlines (section titles)
  headlineMedium, // Medium headlines
  headlineSmall, // Small headlines
  titleLarge, // Large titles (card titles)
  titleMedium, // Medium titles
  titleSmall, // Small titles
  bodyLarge, // Large body text
  bodyMedium, // Medium body text (default)
  bodySmall, // Small body text
  labelLarge, // Large labels (buttons)
  labelMedium, // Medium labels
  labelSmall, // Small labels (captions)
}
