import '../src/app_export.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'Outfit',
    colorScheme: const ColorScheme.light(
      primary: AppLightColors.primary,
      surfaceTint: Colors.transparent,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    scaffoldBackgroundColor: AppLightColors.backgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppLightColors.white,
    ),
    primaryColor: AppLightColors.primary,
  );

  static final darkTheme = ThemeData(
    fontFamily: 'Outfit',
    colorScheme: const ColorScheme.dark(
      primary: AppDarkColors.primary,
      surfaceTint: Colors.transparent,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      },
    ),
    scaffoldBackgroundColor: AppDarkColors.backgroundColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppDarkColors.black,
    ),
    primaryColor: AppDarkColors.primary,
  );
}
