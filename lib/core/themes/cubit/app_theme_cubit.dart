import '../../src/app_export.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeState(status: AppThemeStatus.initial));

  static AppThemeCubit get(context) => BlocProvider.of<AppThemeCubit>(context);

  final preferences = getIt<SharedPreferences>();

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setAppTheme() {
    preferences.setBool('AppTheme', isDarkMode);
  }

  bool? fetchAppTheme() {
    return preferences.getBool('AppTheme');
  }

  void applyAppTheme() {
    final isDarkModeFetched = fetchAppTheme();
    isDarkModeFetched == null
        ? setInitialThemeMode()
        : _themeMode = isDarkModeFetched ? ThemeMode.dark : ThemeMode.light;
    emit(AppThemeState(status: AppThemeStatus.fetched));
  }

  final _brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  bool get isDarkModeSystem => _brightness == Brightness.dark;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void setInitialThemeMode() {
    isDarkModeSystem
        ? _themeMode = ThemeMode.dark
        : _themeMode = ThemeMode.light;
  }

  void toggleTheme(bool isOn) {
    emit(AppThemeState(status: AppThemeStatus.initial));
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    setAppTheme();
    emit(AppThemeState(status: AppThemeStatus.changed));
  }
}
