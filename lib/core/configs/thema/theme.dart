import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

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

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff004a59),
      surfaceTint: Color(0xff00687c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2b7e93),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004b50),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff238088),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff004b48),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff25817c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafd),
      onSurface: Color(0xff171c1e),
      onSurfaceVariant: Color(0xff3c4447),
      outline: Color(0xff586064),
      outlineVariant: Color(0xff737c7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3133),
      inversePrimary: Color(0xff85d1e8),
      background: Color(0xffe9eff1),
      onBackground: Color(0xffe9eff1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00262f),
      surfaceTint: Color(0xff00687c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004a59),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00272a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004b50),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff002725),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff004b48),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafd),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff1d2528),
      outline: Color(0xff3c4447),
      outlineVariant: Color(0xff3c4447),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3133),
      inversePrimary: Color(0xffcdf2ff),
      background: Color(0xffe9eff1),
      onBackground: Color(0xffe9eff1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
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

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8ad6ed),
      surfaceTint: Color(0xff85d1e8),
      onPrimary: Color(0xff001920),
      primaryContainer: Color(0xff4d9bb1),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff85d8e1),
      onSecondary: Color(0xff001a1c),
      secondaryContainer: Color(0xff479da5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff85d9d3),
      onTertiary: Color(0xff001a19),
      tertiaryContainer: Color(0xff489e98),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1416),
      onSurface: Color(0xfff6fbfe),
      onSurfaceVariant: Color(0xffc3ccd0),
      outline: Color(0xff9ba4a8),
      outlineVariant: Color(0xff7c8588),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e6),
      inversePrimary: Color(0xff004f5f),
      background: Color(0xff1b2022),
      onBackground: Color(0xff1b2022),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff5fcff),
      surfaceTint: Color(0xff85d1e8),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff8ad6ed),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffeffeff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff85d8e1),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffeafffc),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff85d9d3),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0f1416),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff5fcff),
      outline: Color(0xffc3ccd0),
      outlineVariant: Color(0xffc3ccd0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e6),
      inversePrimary: Color(0xff002f39),
      background: Color(0xff1b2022),
      onBackground: Color(0xff1b2022),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


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


  List<ExtendedColor> get extendedColors => [
  ];
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
