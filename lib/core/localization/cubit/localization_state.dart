part of 'localization_cubit.dart';

enum LocalizationStatus {
  initial,
  changed,
}

class LocalizationState {
  final LocalizationStatus status;
  final Locale locale;

  LocalizationState({
    required this.status,
    required this.locale,
  });
}

extension LocalizationStatusEx on LocalizationState {
  bool get isInitial => status == LocalizationStatus.initial;
  bool get isChanged => status == LocalizationStatus.changed;
}
