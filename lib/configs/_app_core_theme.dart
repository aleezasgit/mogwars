part of 'configs.dart';

// ─── Gradient Style (2 or 3 color stops) ───────────────────────────────────

class GradientStyle {
  final Color startColor;
  final Color middleColor;
  final Color endColor;

  const GradientStyle({
    required this.startColor,
    required this.middleColor,
    required this.endColor,
  });

  /// Use when gradient has only 2 stops (middleColor is ignored)
  const GradientStyle.twoStop({
    required this.startColor,
    required this.endColor,
  }) : middleColor = endColor; // fallback — middle = end gives a clean 2-stop

  LinearGradient get gradient =>
      LinearGradient(colors: [startColor, middleColor, endColor]);

  LinearGradient get gradientTwoStop =>
      LinearGradient(colors: [startColor, endColor]);

  GradientStyle copyWith({
    Color? startColor,
    Color? middleColor,
    Color? endColor,
  }) {
    return GradientStyle(
      startColor: startColor ?? this.startColor,
      middleColor: middleColor ?? this.middleColor,
      endColor: endColor ?? this.endColor,
    );
  }
}

// ─── Diamond Gradients (7 named styles) ────────────────────────────────────

class DiamondGradients {
  final GradientStyle blue;
  final GradientStyle purple;
  final GradientStyle green;
  final GradientStyle red;
  final GradientStyle orange;
  final GradientStyle yellow;
  final GradientStyle grey;

  const DiamondGradients({
    required this.blue,
    required this.purple,
    required this.green,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.grey,
  });

  DiamondGradients copyWith({
    GradientStyle? blue,
    GradientStyle? purple,
    GradientStyle? green,
    GradientStyle? red,
    GradientStyle? orange,
    GradientStyle? yellow,
    GradientStyle? grey,
  }) {
    return DiamondGradients(
      blue: blue ?? this.blue,
      purple: purple ?? this.purple,
      green: green ?? this.green,
      red: red ?? this.red,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      grey: grey ?? this.grey,
    );
  }
}

// ─── Linier Gradients (9 named styles) ─────────────────────────────────────

class LinierGradients {
  final GradientStyle blue;
  final GradientStyle purple;
  final GradientStyle green;
  final GradientStyle red;
  final GradientStyle orange;
  final GradientStyle yellow;
  final GradientStyle grey;
  final GradientStyle black;
  final GradientStyle divider;

  const LinierGradients({
    required this.blue,
    required this.purple,
    required this.green,
    required this.red,
    required this.orange,
    required this.yellow,
    required this.grey,
    required this.black,
    required this.divider,
  });

  LinierGradients copyWith({
    GradientStyle? blue,
    GradientStyle? purple,
    GradientStyle? green,
    GradientStyle? red,
    GradientStyle? orange,
    GradientStyle? yellow,
    GradientStyle? grey,
    GradientStyle? black,
    GradientStyle? divider,
  }) {
    return LinierGradients(
      blue: blue ?? this.blue,
      purple: purple ?? this.purple,
      green: green ?? this.green,
      red: red ?? this.red,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      grey: grey ?? this.grey,
      black: black ?? this.black,
      divider: divider ?? this.divider,
    );
  }
}

// ─── Rank Gradients (3 named styles: 1st/2nd/3rd place) ────────────────────

class RankGradients {
  final GradientStyle blue; // 1st
  final GradientStyle orange; // 2nd
  final GradientStyle purple; // 3rd

  const RankGradients({
    required this.blue,
    required this.orange,
    required this.purple,
  });

  RankGradients copyWith({
    GradientStyle? blue,
    GradientStyle? orange,
    GradientStyle? purple,
  }) {
    return RankGradients(
      blue: blue ?? this.blue,
      orange: orange ?? this.orange,
      purple: purple ?? this.purple,
    );
  }
}

// ─── Umbrella class ─────────────────────────────────────────────────────────

class AppGradients {
  final DiamondGradients diamond;
  final LinierGradients linier;
  final RankGradients rank;

  const AppGradients({
    required this.diamond,
    required this.linier,
    required this.rank,
  });

  AppGradients copyWith({
    DiamondGradients? diamond,
    LinierGradients? linier,
    RankGradients? rank,
  }) {
    return AppGradients(
      diamond: diamond ?? this.diamond,
      linier: linier ?? this.linier,
      rank: rank ?? this.rank,
    );
  }
}

// ─── Existing classes (unchanged) ───────────────────────────────────────────

class ColorShades {
  final Color? shade100;
  final Color? shade200;
  final Color? shade300;
  final Color? shade400;
  final Color? shade500;
  final Color? shade600;
  final Color? shade700;
  final Color? shade800;
  final Color? main;

  const ColorShades({
    this.shade100,
    this.shade200,
    this.shade300,
    this.shade400,
    this.shade500,
    this.shade600,
    this.shade700,
    this.shade800,
    this.main,
  });

  ColorShades copyWith({
    Color? shade100,
    Color? shade200,
    Color? shade300,
    Color? shade400,
    Color? shade500,
    Color? shade600,
    Color? shade700,
    Color? shade800,
    Color? main,
  }) {
    return ColorShades(
      shade100: shade100 ?? this.shade100,
      shade200: shade200 ?? this.shade200,
      shade300: shade300 ?? this.shade300,
      shade400: shade400 ?? this.shade400,
      shade500: shade500 ?? this.shade500,
      shade600: shade600 ?? this.shade600,
      shade700: shade700 ?? this.shade700,
      shade800: shade800 ?? this.shade800,
      main: main ?? this.main,
    );
  }
}

class AccentColors {
  final Color? orange;
  final Color? orangeLight;
  final Color? yellowLight;
  final Color? yellow;
  final Color? purpleLight;
  final Color? purple;
  final Color? pinkLight;
  final Color? pink;
  final Color? red;
  final Color? green;
  final Color? greenLight;

  const AccentColors({
    this.orange,
    this.orangeLight,
    this.yellowLight,
    this.yellow,
    this.purpleLight,
    this.purple,
    this.pinkLight,
    this.pink,
    this.red,
    this.green,
    this.greenLight,
  });

  AccentColors copyWith({
    Color? orange,
    Color? orangeLight,
    Color? yellowLight,
    Color? yellow,
    Color? purpleLight,
    Color? purple,
    Color? pinkLight,
    Color? pink,
    Color? red,
    Color? green,
    Color? greenLight,
  }) {
    return AccentColors(
      orange: orange ?? this.orange,
      orangeLight: orangeLight ?? this.orangeLight,
      yellowLight: yellowLight ?? this.yellowLight,
      yellow: yellow ?? this.yellow,
      purpleLight: purpleLight ?? this.purpleLight,
      purple: purple ?? this.purple,
      pinkLight: pinkLight ?? this.pinkLight,
      pink: pink ?? this.pink,
      red: red ?? this.red,
      green: green ?? this.green,
      greenLight: greenLight ?? this.greenLight,
    );
  }
}

class PrimaryGradient {
  final Color startColor;
  final Color endColor;

  const PrimaryGradient({required this.startColor, required this.endColor});

  LinearGradient get gradient => LinearGradient(colors: [startColor, endColor]);

  PrimaryGradient copyWith({Color? startColor, Color? endColor}) {
    return PrimaryGradient(
      startColor: startColor ?? this.startColor,
      endColor: endColor ?? this.endColor,
    );
  }
}

// ─── AppCoreTheme (gradients field added) ───────────────────────────────────

class AppCoreTheme {
  final ColorShades primary;
  final AccentColors accent;
  final ColorShades background;
  final ColorShades text;
  final ColorShades lightGrey;
  final ColorShades error;
  final PrimaryGradient primaryGradient;
  final AppGradients gradients; // ⬅ NEW

  final Color? white;
  final Color? black;

  const AppCoreTheme({
    required this.primary,
    required this.accent,
    required this.background,
    required this.text,
    required this.lightGrey,
    this.white,
    required this.error,
    this.black,
    required this.primaryGradient,
    required this.gradients, // ⬅ NEW
  });

  Color? get purple => null;

  AppCoreTheme copyWith({
    ColorShades? primary,
    AccentColors? accent,
    ColorShades? background,
    ColorShades? text,
    ColorShades? lightGrey,
    ColorShades? error,
    PrimaryGradient? primaryGradient,
    AppGradients? gradients, // ⬅ NEW
    Color? white,
    Color? black,
  }) {
    return AppCoreTheme(
      primary: primary ?? this.primary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      text: text ?? this.text,
      lightGrey: lightGrey ?? this.lightGrey,
      white: white ?? this.white,
      black: black ?? this.black,
      error: error ?? this.error,
      primaryGradient: primaryGradient ?? this.primaryGradient,
      gradients: gradients ?? this.gradients, // ⬅ NEW
    );
  }
}
