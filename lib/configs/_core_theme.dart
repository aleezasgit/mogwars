part of 'configs.dart';

const headingFontFamily = 'Aeonik';
const bodyFontFamily = 'Aeonik Trail';

final themeDark = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: AppTheme.dark.background.main,
    foregroundColor: AppTheme.dark.text.shade100,
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.dark.primary.main),
  ),
  useMaterial3: true,
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.transparent,
    indicatorColor: AppTheme.dark.lightGrey.shade100,
    iconTheme: WidgetStateProperty.all(
      IconThemeData(color: AppTheme.dark.primary.main),
    ),
  ),
  primaryColor: AppTheme.dark.primary.main,
  brightness: Brightness.dark,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  scaffoldBackgroundColor: AppTheme.dark.background.main,
  scrollbarTheme: ScrollbarThemeData(
    thumbColor: WidgetStateProperty.all(AppTheme.dark.primary.main),
  ),
  primaryColorDark: AppTheme.dark.primary.main,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: AppTheme.dark.primary.main,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  colorScheme: ThemeData.dark().colorScheme.copyWith(
    primary: AppTheme.dark.primary.main,
    onPrimary: AppTheme.dark.white,
    secondary: AppTheme.dark.primary.main,
    surface: AppTheme.dark.background.shade200,
    onSurface: AppTheme.dark.text.shade800,
    onSurfaceVariant: AppTheme.dark.text.main,
    outline: AppTheme.dark.lightGrey.main,
    error: AppTheme.dark.error.main,
    onError: AppTheme.dark.white,
  ),
);
