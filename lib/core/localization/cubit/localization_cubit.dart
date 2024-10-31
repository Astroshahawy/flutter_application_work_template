import '../../src/app_export.dart';

part 'localization_state.dart';

class LocalizationBloc extends Cubit<LocalizationState> {
  LocalizationBloc()
      : super(LocalizationState(
          status: LocalizationStatus.initial,
          locale: AppLocalization.supportedLocales.first,
        ));

  static LocalizationBloc get(context) =>
      BlocProvider.of<LocalizationBloc>(context);

  void setDefaultLanguage() {
    getIt<SharedPreferences>()
        .setString('locale', AppLocalization.supportedLocales.first.toString());
  }

  void changeLanguageToArabic() {
    getIt<SharedPreferences>()
        .setString('locale', AppLocalization.supportedLocales.first.toString());
    emit(
      LocalizationState(
        status: LocalizationStatus.changed,
        locale: AppLocalization.supportedLocales.first,
      ),
    );
  }

  void changeLanguageToEnglish() {
    getIt<SharedPreferences>()
        .setString('locale', AppLocalization.supportedLocales.last.toString());
    emit(
      LocalizationState(
        status: LocalizationStatus.changed,
        locale: AppLocalization.supportedLocales.last,
      ),
    );
  }
}
