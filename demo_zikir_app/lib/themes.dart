import 'package:flutter/material.dart';

class ZikirTheme {
  final String name;
  final List<Color> gradientColors;
  final Color primaryTextColor;
  final Color secondaryTextColor;

  const ZikirTheme({
    required this.name,
    required this.gradientColors,
    required this.primaryTextColor,
    required this.secondaryTextColor,
  });
}

class AppThemes {
  static const ZikirTheme purpleBlue = ZikirTheme(
    name: 'Purple Blue',
    gradientColors: [
      Color(0xFF667eea),
      Color(0xFF764ba2),
      Color(0xFFf093fb),
    ],
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.white70,
  );

  static const ZikirTheme oceanBreeze = ZikirTheme(
    name: 'Ocean Breeze',
    gradientColors: [
      Color(0xFF2193b0),
      Color(0xFF6dd5ed),
      Color(0xFF4facfe),
    ],
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.white70,
  );

  static const ZikirTheme sunsetGlow = ZikirTheme(
    name: 'Sunset Glow',
    gradientColors: [
      Color(0xFFff9a9e),
      Color(0xFFfecfef),
      Color(0xFFfecfef),
    ],
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.white70,
  );

  static const ZikirTheme forestGreen = ZikirTheme(
    name: 'Forest Green',
    gradientColors: [
      Color(0xFF134e5e),
      Color(0xFF71b280),
      Color(0xFF92fe9d),
    ],
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.white70,
  );

  static const ZikirTheme goldenHour = ZikirTheme(
    name: 'Golden Hour',
    gradientColors: [
      Color(0xFFf12711),
      Color(0xFFf5af19),
      Color(0xFFfdb99b),
    ],
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.white70,
  );

  static const ZikirTheme midnightBlue = ZikirTheme(
    name: 'Midnight Blue',
    gradientColors: [
      Color(0xFF2c3e50),
      Color(0xFF3498db),
      Color(0xFF5dade2),
    ],
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.white70,
  );

  static const ZikirTheme royalPurple = ZikirTheme(
    name: 'Royal Purple',
    gradientColors: [
      Color(0xFF8360c3),
      Color(0xFF2ebf91),
      Color(0xFF48c6ef),
    ],
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.white70,
  );

  static const ZikirTheme warmSunset = ZikirTheme(
    name: 'Warm Sunset',
    gradientColors: [
      Color(0xFFee0979),
      Color(0xFFff6a00),
      Color(0xFFffb347),
    ],
    primaryTextColor: Colors.white,
    secondaryTextColor: Colors.white70,
  );

  // List of all available themes
  static const List<ZikirTheme> allThemes = [
    purpleBlue,
    oceanBreeze,
    sunsetGlow,
    forestGreen,
    goldenHour,
    midnightBlue,
    royalPurple,
    warmSunset,
  ];

  // Get theme by name
  static ZikirTheme getThemeByName(String name) {
    return allThemes.firstWhere(
      (theme) => theme.name == name,
      orElse: () => purpleBlue,
    );
  }
}

// Theme notifier for state management
class ThemeNotifier extends ChangeNotifier {
  ZikirTheme _currentTheme = AppThemes.purpleBlue;

  ZikirTheme get currentTheme => _currentTheme;

  void setTheme(ZikirTheme theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void setThemeByName(String themeName) {
    _currentTheme = AppThemes.getThemeByName(themeName);
    notifyListeners();
  }
}