part of 'app_theme_cubit.dart';

enum AppThemeStatus {
  initial,
  fetched,
  changed,
}

class AppThemeState {
  final AppThemeStatus status;

  AppThemeState({required this.status});
}

extension AppThemeStatusEx on AppThemeState {
  bool get isInitial => status == AppThemeStatus.initial;
  bool get isFetched => status == AppThemeStatus.fetched;
  bool get isChanged => status == AppThemeStatus.changed;
}