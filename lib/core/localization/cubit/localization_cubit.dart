import '../../src/app_export.dart';

part 'localization_state.dart';

class LocalizationBloc extends Cubit<LocalizationState> {
  LocalizationBloc() : super(LocalizationInit());

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
      LocalizationChange(
        AppLocalization.supportedLocales.first,
      ),
    );
  }

  void changeLanguageToEnglish() {
    getIt<SharedPreferences>()
        .setString('locale', AppLocalization.supportedLocales.last.toString());
    emit(
      LocalizationChange(
        AppLocalization.supportedLocales.last,
      ),
    );
  }
}
