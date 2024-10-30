import '../../src/app_export.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeState(status: AppThemeStatus.initial));

  static AppThemeCubit get(context) => BlocProvider.of<AppThemeCubit>(context);

  Future<SharedPreferences> getPreferences() async {
    return await SharedPreferences.getInstance();
  }

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> setAppTheme() async {
    final preferences = await getPreferences();
    preferences.setBool('AppTheme', isDarkMode);
  }

  Future<bool?> fetchAppTheme() async {
    final preferences = await getPreferences();
    return preferences.getBool('AppTheme');
  }

  Future<void> applyAppTheme() async {
    final isDarkModeFetched = await fetchAppTheme();
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
