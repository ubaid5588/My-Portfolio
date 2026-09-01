import 'package:flutter/material.dart';

class AppColors {
  // Theme Backgrounds
  static const Color darkBackground = Color(0xFF03030A);
  static const Color lightBackground = Color(0xFFF2F4FF);
  static const Color lightCardBackground = Color(0xFFF8F9FF);

  // Text Colors
  static const Color darkTextPrimary = Color(0xFFF0F0FF);
  static const Color darkTextSecondary = Color(0xA6F0F0FF); // ~65% opacity
  static const Color darkTextMuted = Color(0x66F0F0FF);     // ~40% opacity

  static const Color lightTextPrimary = Color(0xFF0A0A1A);
  static const Color lightTextSecondary = Color(0xA60A0A1A);
  static const Color lightTextMuted = Color(0x660A0A1A);

  // Accents
  static const Color accentBlue = Color(0xFF5B8EFF);
  static const Color accentViolet = Color(0xFF9B6DFF);
  static const Color accentCyan = Color(0xFF4ECDC4);
  static const Color accentRose = Color(0xFFFF6B9D);
  static const Color accentAmber = Color(0xFFFFB347);
  static const Color accentCoral = Color(0xFFFF8E6B);
  static const Color accentGitHub = Color(0xFFD0D0FF);

  // Glass Dark
  static const Color darkGlassBg = Color(0x0FFFFFFF);        // rgba(255,255,255,0.06)
  static const Color darkGlassHeavyBg = Color(0x14FFFFFF);   // rgba(255,255,255,0.08)
  static const Color darkGlassSubtleBg = Color(0x08FFFFFF);  // rgba(255,255,255,0.03)
  static const Color darkGlassBorder = Color(0x1FFFFFFF);    // rgba(255,255,255,0.12)
  static const Color darkGlassHighlight = Color(0x26FFFFFF); // rgba(255,255,255,0.15)

  // Glass Light
  static const Color lightGlassBg = Color(0xB3FFFFFF);       // rgba(255,255,255,0.7)
  static const Color lightGlassHeavyBg = Color(0xD9FFFFFF);  // rgba(255,255,255,0.85)
  static const Color lightGlassSubtleBg = Color(0x80FFFFFF); // rgba(255,255,255,0.5)
  static const Color lightGlassBorder = Color(0x14000000);   // rgba(0,0,0,0.08)
  static const Color lightGlassHighlight = Color(0xE6FFFFFF);// rgba(255,255,255,0.9)

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [accentBlue, accentViolet, accentCyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [accentRose, accentViolet, accentBlue],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [accentBlue, accentViolet],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient iridescentGradient = LinearGradient(
    colors: [
      Color(0x265B8EFF),
      Color(0x1F9B6DFF),
      Color(0x1A4ECDC4),
      Color(0x1F9B6DFF),
      Color(0x265B8EFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
