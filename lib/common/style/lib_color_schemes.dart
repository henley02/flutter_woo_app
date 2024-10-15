import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1044bf),
      surfaceTint: Color(0xff2954ce),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff456ce5),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff44485b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff686c81),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5d3f59),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff84637e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff97000b),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c28),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8f8),
      onSurface: Color(0xff1c1b1c),
      onSurfaceVariant: Color(0xff46464b),
      outline: Color(0xff77777b),
      outlineVariant: Color(0xffc7c6cb),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffb6c4ff),
      primaryFixed: Color(0xffdce1ff),
      onPrimaryFixed: Color(0xff00164f),
      primaryFixedDim: Color(0xffb6c4ff),
      onPrimaryFixedVariant: Color(0xff003ab1),
      secondaryFixed: Color(0xffdee1f9),
      onSecondaryFixed: Color(0xff161b2c),
      secondaryFixedDim: Color(0xffc2c5dd),
      onSecondaryFixedVariant: Color(0xff424659),
      tertiaryFixed: Color(0xffffd7f6),
      onTertiaryFixed: Color(0xff2b122a),
      tertiaryFixedDim: Color(0xffe2bbda),
      onTertiaryFixedVariant: Color(0xff5b3d57),
      surfaceDim: Color(0xffddd9d9),
      surfaceBright: Color(0xfffcf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1eded),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb6c4ff),
      surfaceTint: Color(0xffb6c4ff),
      onPrimary: Color(0xff00277e),
      primaryContainer: Color(0xff456ce5),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffc2c5dd),
      onSecondary: Color(0xff2b3042),
      secondaryContainer: Color(0xff4f5367),
      onSecondaryContainer: Color(0xfff7f6ff),
      tertiary: Color(0xffe2bbda),
      onTertiary: Color(0xff43273f),
      tertiaryContainer: Color(0xff6a4b65),
      onTertiaryContainer: Color(0xfffff5f9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xffad0e13),
      onErrorContainer: Color(0xfffff9f8),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc7c6cb),
      outline: Color(0xff919095),
      outlineVariant: Color(0xff46464b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff2954ce),
      primaryFixed: Color(0xffdce1ff),
      onPrimaryFixed: Color(0xff00164f),
      primaryFixedDim: Color(0xffb6c4ff),
      onPrimaryFixedVariant: Color(0xff003ab1),
      secondaryFixed: Color(0xffdee1f9),
      onSecondaryFixed: Color(0xff161b2c),
      secondaryFixedDim: Color(0xffc2c5dd),
      onSecondaryFixedVariant: Color(0xff424659),
      tertiaryFixed: Color(0xffffd7f6),
      onTertiaryFixed: Color(0xff2b122a),
      tertiaryFixedDim: Color(0xffe2bbda),
      onTertiaryFixedVariant: Color(0xff5b3d57),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1c),
      surfaceContainer: Color(0xff201f20),
      surfaceContainerHigh: Color(0xff2a2a2a),
      surfaceContainerHighest: Color(0xff353435),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        appBarTheme: AppBarTheme(
          color: colorScheme.primary,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
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
