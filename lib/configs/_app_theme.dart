part of 'configs.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    // PRIMARY group
    primary: ColorShades(
      main: const Color(0xFFE13C36), // primary
      shade100: const Color(0xFFF2A7A5),
      shade200: const Color(0xFFEF9692),
      shade300: const Color(0xFFEC807C),
      shade500: const Color(0xFFCB3631),
      shade600: const Color(0xFFB4302B),
      shade700: const Color(0xFF651B18),
      shade800: const Color(0xFF4F1513),
    ),

    // ACCENT group
    accent: AccentColors(
      purple: const Color(0xFFDAD2FF),
      purpleLight: const Color(0xFFF4F1FF),
      pinkLight: const Color(0xFFF9F3FD),
      pink: const Color(0xFFEDD8FA),

      yellowLight: const Color(0xFFFEFAEB),
      yellow: const Color(0xFFF2CE3A),
      green: const Color(0xFF0A6A2B),
      greenLight: const Color(0xFFE7F0EA),
      red: const Color(0xFFF65555),
      orangeLight: const Color(0xFFFFF1E9),
      orange: const Color(0xFFFA7522),
    ),

    // BACKGROUND group
    background: ColorShades(
      shade100: const Color(0xFF141414), //
      shade200: const Color(0xFF0D0D0D), //
      shade400: const Color(0xFF030303), //
      shade500: const Color(0xFF000000), //
      main: const Color(0xFF020202), // background
    ),

    // TEXT group
    text: ColorShades(
      main: const Color(0xFF74849B), // grey
      shade100: const Color(0xFFFCFCFD), //
      shade200: const Color(0xFFC4CBD4), //
      shade300: const Color(0xFF74849B), //
      shade600: const Color(0xFFD4D4D6), //
      shade700: const Color(0xFFEAEAEB), //
      shade800: const Color(0xFFFFFFFF), //
    ),

    // LIGHT GREY group
    lightGrey: ColorShades(
      main: const Color(0xFF414141), // lightGrey
      shade300: const Color(0xFF3B3B3B), //
      shade200: const Color(0x33363636), //
      shade100: const Color(0xFF212121), //
      shade400: const Color(0xFFD9D9D9), //
      shade500: const Color(0xFF8697AC), //
      shade600: const Color(0xFFE7ECF0), //
    ),

    //Error Group
    error: ColorShades(
      main: Color(0xFFF65555),
      shade100: Color(0xFFFEE6E6),
      shade800: Color(0xFFDF1C41),
    ),

    //Primary Gradient
    primaryGradient: PrimaryGradient(
      startColor: const Color(0xFF05F9FE), // primary.main
      endColor: const Color(0xFF8E43EF), // secondary.main
    ),

    // SINGLE COLORS (no shades)
    white: const Color(0xFFFFFFFF), //
    black: const Color(0xFF040714), //

    gradients: AppGradients(
      diamond: DiamondGradients(
        blue: GradientStyle.twoStop(
          startColor: Color(0xFF93C2FD),
          endColor: Color(0xFF0167FF),
        ),
        purple: GradientStyle.twoStop(
          startColor: Color(0xFFCDA3FF),
          endColor: Color(0xFF9D4CFF),
        ),
        green: GradientStyle.twoStop(
          startColor: Color(0xFF73F2A1),
          endColor: Color(0xFF11B14B),
        ),
        red: GradientStyle.twoStop(
          startColor: Color(0xFFF2897D),
          endColor: Color(0xFFE52B16),
        ),
        orange: GradientStyle.twoStop(
          startColor: Color(0xFFFCB182),
          endColor: Color(0xFFFA7522),
        ),
        yellow: GradientStyle.twoStop(
          startColor: Color(0xFFFEE281),
          endColor: Color(0xFFF6C002),
        ),
        grey: GradientStyle.twoStop(
          startColor: Color(0xFFB7B6B9),
          endColor: Color(0xFF69686D),
        ),
      ),
      linier: LinierGradients(
        blue: GradientStyle.twoStop(
          startColor: Color(0xFF0167FF),
          endColor: Color(0xFFB0D0FF),
        ),
        purple: GradientStyle.twoStop(
          startColor: Color(0xFF9D4CFF),
          endColor: Color(0xFFE1C8FF),
        ),
        green: GradientStyle.twoStop(
          startColor: Color(0xFF11B14B),
          endColor: Color(0xFFB5E7C7),
        ),
        red: GradientStyle.twoStop(
          startColor: Color(0xFFE52B16),
          endColor: Color(0xFFF7BDB7),
        ),
        orange: GradientStyle.twoStop(
          startColor: Color(0xFFFA7522),
          endColor: Color(0xFFFDD4BA),
        ),
        yellow: GradientStyle.twoStop(
          startColor: Color(0xFFF6C002),
          endColor: Color(0xFFFCEBB1),
        ),
        grey: GradientStyle.twoStop(
          startColor: Color(0xFF69686D),
          endColor: Color(0xFFD1D0D2),
        ),
        black: GradientStyle.twoStop(
          startColor: Color(0xFF151823),
          endColor: Color(0xFF94969B),
        ),
        divider: GradientStyle(
          startColor: Color(0x40E9EAEA),
          middleColor: Color(0xFFE9EAEA),
          endColor: Color(0x40E9EAEA),
        ),
      ),
      rank: RankGradients(
        blue: GradientStyle(
          startColor: Color(0xFF0095FF),
          middleColor: Color(0xFFA0D8FF),
          endColor: Color(0xFF0095FF),
        ),
        orange: GradientStyle(
          startColor: Color(0xFFFF8A00),
          middleColor: Color(0xFFFFD6A5),
          endColor: Color(0xFFFF8A00),
        ),
        purple: GradientStyle(
          startColor: Color(0xFF860092),
          middleColor: Color(0xFFD52FFF),
          endColor: Color(0xFF860092),
        ),
      ),
    ),
  );

  static AppCoreTheme light = _core;
  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static void init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }
}
