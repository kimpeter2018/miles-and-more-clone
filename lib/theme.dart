import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4283587218),
      surfaceTint: Color(4283587218),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4292862207),
      onPrimaryContainer: Color(4278981963),
      secondary: Color(4282801553),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4292469503),
      onSecondaryContainer: Color(4278196548),
      tertiary: Color(4283260050),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292665855),
      onTertiaryContainer: Color(4278458187),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282795599),
      outline: Color(4286019200),
      outlineVariant: Color(4291282384),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290495487),
      primaryFixed: Color(4292862207),
      onPrimaryFixed: Color(4278981963),
      primaryFixedDim: Color(4290495487),
      onPrimaryFixedVariant: Color(4282073721),
      secondaryFixed: Color(4292469503),
      onSecondaryFixed: Color(4278196548),
      secondaryFixedDim: Color(4289775359),
      onSecondaryFixedVariant: Color(4281222520),
      tertiaryFixed: Color(4292665855),
      onTertiaryFixed: Color(4278458187),
      tertiaryFixedDim: Color(4290168063),
      onTertiaryFixedVariant: Color(4281681017),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4281810548),
      surfaceTint: Color(4283587218),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285100458),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4280893812),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284314793),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281417844),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284707498),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4279966497),
      onSurfaceVariant: Color(4282532427),
      outline: Color(4284374631),
      outlineVariant: Color(4286216835),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4290495487),
      primaryFixed: Color(4285100458),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283455632),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284314793),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282669967),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284707498),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283062671),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4279508050),
      surfaceTint: Color(4283587218),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281810548),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278198353),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4280893812),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278984274),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281417844),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294703359),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280492843),
      outline: Color(4282532427),
      outlineVariant: Color(4282532427),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281348150),
      inversePrimary: Color(4293651199),
      primaryFixed: Color(4281810548),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4280297565),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4280893812),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279184220),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281417844),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4279839069),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292598240),
      surfaceBright: Color(4294703359),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294308602),
      surfaceContainer: Color(4293914100),
      surfaceContainerHigh: Color(4293519343),
      surfaceContainerHighest: Color(4293190121),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290495487),
      surfaceTint: Color(4290495487),
      onPrimary: Color(4280560737),
      primaryContainer: Color(4282073721),
      onPrimaryContainer: Color(4292862207),
      secondary: Color(4289775359),
      onSecondary: Color(4279512672),
      secondaryContainer: Color(4281222520),
      onSecondaryContainer: Color(4292469503),
      tertiary: Color(4290168063),
      onTertiary: Color(4280102241),
      tertiaryContainer: Color(4281681017),
      onTertiaryContainer: Color(4292665855),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279440152),
      onSurface: Color(4293190121),
      onSurfaceVariant: Color(4291282384),
      outline: Color(4287664282),
      outlineVariant: Color(4282795599),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4283587218),
      primaryFixed: Color(4292862207),
      onPrimaryFixed: Color(4278981963),
      primaryFixedDim: Color(4290495487),
      onPrimaryFixedVariant: Color(4282073721),
      secondaryFixed: Color(4292469503),
      onSecondaryFixed: Color(4278196548),
      secondaryFixedDim: Color(4289775359),
      onSecondaryFixedVariant: Color(4281222520),
      tertiaryFixed: Color(4292665855),
      onTertiaryFixed: Color(4278458187),
      tertiaryFixedDim: Color(4290168063),
      onTertiaryFixedVariant: Color(4281681017),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4290889727),
      surfaceTint: Color(4290495487),
      onPrimary: Color(4278587206),
      primaryContainer: Color(4286942664),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290169599),
      onSecondary: Color(4278195258),
      secondaryContainer: Color(4286156999),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290562303),
      onTertiary: Color(4278194500),
      tertiaryContainer: Color(4286549704),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440152),
      onSurface: Color(4294834687),
      onSurfaceVariant: Color(4291545556),
      outline: Color(4288914092),
      outlineVariant: Color(4286808716),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4282139770),
      primaryFixed: Color(4292862207),
      onPrimaryFixed: Color(4278257729),
      primaryFixedDim: Color(4290495487),
      onPrimaryFixedVariant: Color(4280955239),
      secondaryFixed: Color(4292469503),
      onSecondaryFixed: Color(4278193968),
      secondaryFixedDim: Color(4289775359),
      onSecondaryFixedVariant: Color(4279972966),
      tertiaryFixed: Color(4292665855),
      onTertiaryFixed: Color(4278193464),
      tertiaryFixedDim: Color(4290168063),
      onTertiaryFixedVariant: Color(4280496999),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294834687),
      surfaceTint: Color(4290495487),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4290889727),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294769407),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290169599),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294769407),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290562303),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279440152),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294834687),
      outline: Color(4291545556),
      outlineVariant: Color(4291545556),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293190121),
      inversePrimary: Color(4280100186),
      primaryFixed: Color(4293191167),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4290889727),
      onPrimaryFixedVariant: Color(4278587206),
      secondaryFixed: Color(4292863743),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290169599),
      onSecondaryFixedVariant: Color(4278195258),
      tertiaryFixed: Color(4293060095),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290562303),
      onTertiaryFixedVariant: Color(4278194500),
      surfaceDim: Color(4279440152),
      surfaceBright: Color(4281940287),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279966497),
      surfaceContainer: Color(4280229669),
      surfaceContainerHigh: Color(4280887599),
      surfaceContainerHighest: Color(4281611322),
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
