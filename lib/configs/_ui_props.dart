part of 'configs.dart';

abstract class UIProps {
  // Animations
  static Duration duration0 = const Duration(milliseconds: 150);
  static Duration duration = const Duration(milliseconds: 280);
  static Duration duration2 = const Duration(milliseconds: 400);

  // Paddings
  static EdgeInsets? btnPadMed;
  static EdgeInsets? btnPadSm;

  // Radius
  static double radius = 15;
  static BorderRadius? tabRadius;
  static BorderRadius? buttonRadius;
  static BorderRadius? radiusS;
  static BorderRadius? radiusM;
  static BorderRadius? radiusL;
  static BorderRadius? radiusXL;
  static BoxDecoration? borderButton;
  static BorderRadius? topBoth15;
  static BorderRadius? topBoth20;

  // Shadows
  static List<BoxShadow>? cardShadow;
  static List<BoxShadow>? buttonShadow;
  static List<BoxShadow>? redShadow;

  // BoxDecoration
  static BoxDecoration? boxCard;
  static BoxDecoration? popupCard;
  static Gradient? primaryGradient;
  static Gradient? secondaryGradient;

  // Diamond Gradients
  static LinearGradient? diamondBlue;
  static LinearGradient? diamondPurple;
  static LinearGradient? diamondGreen;
  static LinearGradient? diamondRed;
  static LinearGradient? diamondOrange;
  static LinearGradient? diamondYellow;
  static LinearGradient? diamondGrey;

  // Linear Gradients
  static LinearGradient? linearBlue;
  static LinearGradient? linearPurple;
  static LinearGradient? linearGreen;
  static LinearGradient? linearRed;
  static LinearGradient? linearOrange;
  static LinearGradient? linearYellow;
  static LinearGradient? linearGrey;
  static LinearGradient? linearBlack;
  static LinearGradient? linearDivider;

  // Rank Gradients
  static LinearGradient? rankBlue;
  static LinearGradient? rankOrange;
  static LinearGradient? rankPurple;

  static void init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    initRadius(context);
    initButtons();
    initShadows();
    initBoxDecorations();
    initGradient(context);
    initDiamondGradients();
    initLinearGradients();
    initRankGradients();
  }

  static void initRadius(BuildContext context) {
    tabRadius = BorderRadius.circular(radius * 2);
    buttonRadius = BorderRadius.circular(ScreenUtil().radius(16));
    radiusS = BorderRadius.circular(ScreenUtil().radius(8));
    radiusM = BorderRadius.circular(ScreenUtil().radius(16));
    radiusL = BorderRadius.circular(ScreenUtil().radius(24));
    radiusXL = BorderRadius.circular(ScreenUtil().radius(45));
    topBoth15 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(15)),
      topRight: Radius.circular(ScreenUtil().radius(15)),
    );
    topBoth20 = BorderRadius.only(
      topLeft: Radius.circular(ScreenUtil().radius(20)),
      topRight: Radius.circular(ScreenUtil().radius(20)),
    );
  }

  static void initButtons() {
    borderButton = BoxDecoration(
      borderRadius: UIProps.buttonRadius,
      border: Border.all(width: 1.4, color: AppTheme.c.text.shade800!),
    );
    btnPadSm = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 2,
      vertical: AppDimensions.padding! * 1.0,
    );
    btnPadMed = EdgeInsets.symmetric(
      horizontal: AppDimensions.padding! * 3,
      vertical: AppDimensions.padding! * 1.5,
    );
  }

  static void initShadows() {
    cardShadow = [
      BoxShadow(color: Color(0x0F0D0D12), blurRadius: 2, offset: Offset(0, 1)),
    ];
    buttonShadow = [
      BoxShadow(
        color: Color(0x0F0D0D12),
        blurRadius: 2,
        offset: const Offset(0, 1),
      ),
    ];
    redShadow = [
      BoxShadow(
        color: Color(0x8FF65555),
        blurRadius: 20.7,
        offset: Offset(0, 0),
      ),
    ];
  }

  static void initBoxDecorations() {
    boxCard = BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: AppTheme.c.white,
      border: Border.all(color: AppTheme.c.lightGrey.main!, width: 1.w),
    );
  }

  static void initGradient(BuildContext context) {
    primaryGradient = LinearGradient(
      colors: [
        Color.lerp(
          AppTheme.c.primaryGradient.startColor,
          const Color(0xFF6B53DD),
          0.5,
        )!,
        Color.lerp(
          AppTheme.c.primaryGradient.startColor,
          AppTheme.c.primaryGradient.endColor,
          0.5,
        )!,
        Color.lerp(
          AppTheme.c.primaryGradient.startColor,
          AppTheme.c.primaryGradient.endColor,
          0.75,
        )!,
        AppTheme.c.primaryGradient.endColor,
        AppTheme.c.primaryGradient.endColor,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0, 0.15, 0.3, 0.6, 1.0],
      transform: GradientRotation(-0.1),
    );
    secondaryGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        AppTheme.c.primary.shade300!.withValues(alpha: 0.9),
        AppTheme.c.white!,
        AppTheme.c.white!,
      ],
      stops: [0.3, 0.6, 0.1],
      transform: GradientRotation(-3 / 8),
    );
  }

  static void initDiamondGradients() {
    final d = AppTheme.c.gradients.diamond;

    diamondBlue = LinearGradient(
      colors: [d.blue.startColor, d.blue.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    diamondPurple = LinearGradient(
      colors: [d.purple.startColor, d.purple.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    diamondGreen = LinearGradient(
      colors: [d.green.startColor, d.green.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    diamondRed = LinearGradient(
      colors: [d.red.startColor, d.red.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    diamondOrange = LinearGradient(
      colors: [d.orange.startColor, d.orange.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    diamondYellow = LinearGradient(
      colors: [d.yellow.startColor, d.yellow.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    diamondGrey = LinearGradient(
      colors: [d.grey.startColor, d.grey.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  static void initLinearGradients() {
    final l = AppTheme.c.gradients.linier;

    linearBlue = LinearGradient(
      colors: [l.blue.startColor, l.blue.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    linearPurple = LinearGradient(
      colors: [l.purple.startColor, l.purple.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    linearGreen = LinearGradient(
      colors: [l.green.startColor, l.green.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    linearRed = LinearGradient(
      colors: [l.red.startColor, l.red.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    linearOrange = LinearGradient(
      colors: [l.orange.startColor, l.orange.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    linearYellow = LinearGradient(
      colors: [l.yellow.startColor, l.yellow.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    linearGrey = LinearGradient(
      colors: [l.grey.startColor, l.grey.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    linearBlack = LinearGradient(
      colors: [l.black.startColor, l.black.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    linearDivider = LinearGradient(
      colors: [l.divider.startColor, l.divider.endColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static void initRankGradients() {
    final r = AppTheme.c.gradients.rank;

    rankBlue = LinearGradient(
      colors: [r.blue.startColor, r.blue.middleColor, r.blue.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    rankOrange = LinearGradient(
      colors: [r.orange.startColor, r.orange.middleColor, r.orange.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    rankPurple = LinearGradient(
      colors: [r.purple.startColor, r.purple.middleColor, r.purple.endColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
