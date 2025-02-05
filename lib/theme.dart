import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff525a92),
      surfaceTint: Color(0xff525a92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdfe0ff),
      onPrimaryContainer: Color(0xff0c154b),
      secondary: Color(0xff465d91),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd9e2ff),
      onSecondaryContainer: Color(0xff001944),
      tertiary: Color(0xff4d5c92),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffdce1ff),
      onTertiaryContainer: Color(0xff04174b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff46464f),
      outline: Color(0xff777680),
      outlineVariant: Color(0xffc7c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffbbc3ff),
      primaryFixed: Color(0xffdfe0ff),
      onPrimaryFixed: Color(0xff0c154b),
      primaryFixedDim: Color(0xffbbc3ff),
      onPrimaryFixedVariant: Color(0xff3b4279),
      secondaryFixed: Color(0xffd9e2ff),
      onSecondaryFixed: Color(0xff001944),
      secondaryFixedDim: Color(0xffb0c6ff),
      onSecondaryFixedVariant: Color(0xff2e4578),
      tertiaryFixed: Color(0xffdce1ff),
      onTertiaryFixed: Color(0xff04174b),
      tertiaryFixedDim: Color(0xffb6c4ff),
      onTertiaryFixedVariant: Color(0xff354479),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffe9e7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff373e74),
      surfaceTint: Color(0xff525a92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6971aa),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff294174),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5d74a9),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff314074),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6372aa),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff1b1b21),
      onSurfaceVariant: Color(0xff42424b),
      outline: Color(0xff5e5e67),
      outlineVariant: Color(0xff7a7a83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffbbc3ff),
      primaryFixed: Color(0xff6971aa),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff505890),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5d74a9),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff445b8f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6372aa),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4a598f),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffe9e7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff141c52),
      surfaceTint: Color(0xff525a92),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff373e74),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002051),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff294174),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff0c1e52),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff314074),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff23232b),
      outline: Color(0xff42424b),
      outlineVariant: Color(0xff42424b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303036),
      inversePrimary: Color(0xffebeaff),
      primaryFixed: Color(0xff373e74),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff20285d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff294174),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0f2b5c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff314074),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff19295d),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffdbd9e0),
      surfaceBright: Color(0xfffbf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f2fa),
      surfaceContainer: Color(0xffefedf4),
      surfaceContainerHigh: Color(0xffe9e7ef),
      surfaceContainerHighest: Color(0xffe4e1e9),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbbc3ff),
      surfaceTint: Color(0xffbbc3ff),
      onPrimary: Color(0xff242c61),
      primaryContainer: Color(0xff3b4279),
      onPrimaryContainer: Color(0xffdfe0ff),
      secondary: Color(0xffb0c6ff),
      onSecondary: Color(0xff142e60),
      secondaryContainer: Color(0xff2e4578),
      onSecondaryContainer: Color(0xffd9e2ff),
      tertiary: Color(0xffb6c4ff),
      onTertiary: Color(0xff1d2d61),
      tertiaryContainer: Color(0xff354479),
      onTertiaryContainer: Color(0xffdce1ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131318),
      onSurface: Color(0xffe4e1e9),
      onSurfaceVariant: Color(0xffc7c5d0),
      outline: Color(0xff90909a),
      outlineVariant: Color(0xff46464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inversePrimary: Color(0xff525a92),
      primaryFixed: Color(0xffdfe0ff),
      onPrimaryFixed: Color(0xff0c154b),
      primaryFixedDim: Color(0xffbbc3ff),
      onPrimaryFixedVariant: Color(0xff3b4279),
      secondaryFixed: Color(0xffd9e2ff),
      onSecondaryFixed: Color(0xff001944),
      secondaryFixedDim: Color(0xffb0c6ff),
      onSecondaryFixedVariant: Color(0xff2e4578),
      tertiaryFixed: Color(0xffdce1ff),
      onTertiaryFixed: Color(0xff04174b),
      tertiaryFixedDim: Color(0xffb6c4ff),
      onTertiaryFixedVariant: Color(0xff354479),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff29292f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc1c7ff),
      surfaceTint: Color(0xffbbc3ff),
      onPrimary: Color(0xff060f46),
      primaryContainer: Color(0xff858dc8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb6caff),
      onSecondary: Color(0xff00143a),
      secondaryContainer: Color(0xff7990c7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffbcc8ff),
      onTertiary: Color(0xff001144),
      tertiaryContainer: Color(0xff7f8ec8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xfffdf9ff),
      onSurfaceVariant: Color(0xffcbc9d4),
      outline: Color(0xffa3a2ac),
      outlineVariant: Color(0xff83828c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inversePrimary: Color(0xff3c447a),
      primaryFixed: Color(0xffdfe0ff),
      onPrimaryFixed: Color(0xff010841),
      primaryFixedDim: Color(0xffbbc3ff),
      onPrimaryFixedVariant: Color(0xff2a3167),
      secondaryFixed: Color(0xffd9e2ff),
      onSecondaryFixed: Color(0xff000f30),
      secondaryFixedDim: Color(0xffb0c6ff),
      onSecondaryFixedVariant: Color(0xff1b3466),
      tertiaryFixed: Color(0xffdce1ff),
      onTertiaryFixed: Color(0xff000d38),
      tertiaryFixedDim: Color(0xffb6c4ff),
      onTertiaryFixedVariant: Color(0xff233367),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff29292f),
      surfaceContainerHighest: Color(0xff34343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffdf9ff),
      surfaceTint: Color(0xffbbc3ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc1c7ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffcfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb6caff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffcfaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffbcc8ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffdf9ff),
      outline: Color(0xffcbc9d4),
      outlineVariant: Color(0xffcbc9d4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e1e9),
      inversePrimary: Color(0xff1d255a),
      primaryFixed: Color(0xffe4e5ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc1c7ff),
      onPrimaryFixedVariant: Color(0xff060f46),
      secondaryFixed: Color(0xffdfe6ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb6caff),
      onSecondaryFixedVariant: Color(0xff00143a),
      tertiaryFixed: Color(0xffe2e5ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffbcc8ff),
      onTertiaryFixedVariant: Color(0xff001144),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39393f),
      surfaceContainerLowest: Color(0xff0d0e13),
      surfaceContainerLow: Color(0xff1b1b21),
      surfaceContainer: Color(0xff1f1f25),
      surfaceContainerHigh: Color(0xff29292f),
      surfaceContainerHighest: Color(0xff34343a),
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
