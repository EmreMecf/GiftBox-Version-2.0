import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ThemeData light() {
    return ThemeData(
      colorScheme: lightScheme(),
    );
  }

  static ThemeData dark() {
    return ThemeData.dark().copyWith(
      colorScheme: darkScheme(),
    );
  }

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00687c),
      surfaceTint: Color(0xff00687c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb0ecff),
      onPrimaryContainer: Color(0xff001f27),
      secondary: Color(0xff006971),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff9df0f9),
      onSecondaryContainer: Color(0xff002022),
      tertiary: Color(0xff006a65),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9df1ea),
      onTertiaryContainer: Color(0xff00201e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff5fafd),
      onSurface: Color(0xff171c1e),
      onSurfaceVariant: Color(0xff40484b),
      outline: Color(0xff70787c),
      outlineVariant: Color(0xffbfc8cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3133),
      inversePrimary: Color(0xff85d1e8),
      background: Color(0xffe9eff1),
      onBackground: Color(0xffe9eff1),
    );
  }

  static ThemeData lightThemeData() {
    return ThemeData(
      colorScheme: lightScheme(),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff85d1e8),
      surfaceTint: Color(0xff85d1e8),
      onPrimary: Color(0xff003641),
      primaryContainer: Color(0xff004e5e),
      onPrimaryContainer: Color(0xffb0ecff),
      secondary: Color(0xff81d4dc),
      onSecondary: Color(0xff00363b),
      secondaryContainer: Color(0xff004f55),
      onSecondaryContainer: Color(0xff9df0f9),
      tertiary: Color(0xff81d5ce),
      onTertiary: Color(0xff003734),
      tertiaryContainer: Color(0xff00504c),
      onTertiaryContainer: Color(0xff9df1ea),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffdee3e6),
      onSurfaceVariant: Color(0xffbfc8cb),
      outline: Color(0xff899296),
      outlineVariant: Color(0xff40484b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e6),
      inversePrimary: Color(0xff00687c),
      background: Color(0xff1b2022),
      onBackground: Color(0xff1b2022),
    );
  }

  static ThemeData darkThemeData() {
    return ThemeData.dark().copyWith(
      colorScheme: darkScheme(),
    );
  }
}

/*
  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

   */
