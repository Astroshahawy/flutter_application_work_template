import 'app_export.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MultiBlocProvider(
            providers: [
              BlocProvider<InternetCubit>(
                  create: (context) => getIt<InternetCubit>()),
              BlocProvider<LocalizationBloc>(
                  create: (context) => getIt<LocalizationBloc>()..setDefaultLanguage()),
              BlocProvider<AppThemeCubit>(
                  create: (context) => getIt<AppThemeCubit>()),
            ],
            child: BlocBuilder<LocalizationBloc, LocalizationState>(
              buildWhen: (previous, current) => previous != current,
              builder: (_, localeState) {
                return MaterialApp(
                  builder: (context, child) {
                    return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(textScaler: const TextScaler.linear(1)),
                        child: child!);
                  },
                  localizationsDelegates: const [
                    AppLocalizationDelegate(),
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalization.supportedLocales,
                  localeResolutionCallback: (deviceLocale, supportedLocales) {
                    for (var locale in supportedLocales) {
                      if (deviceLocale != null &&
                          deviceLocale.languageCode == locale.languageCode) {
                        return deviceLocale;
                      }
                    }
                    return supportedLocales.first;
                  },
                  locale: getIt<SharedPreferences>().getString('locale') == null
                      ? localeState.locale
                      : Locale(getIt<SharedPreferences>().getString('locale')!),
                  title: 'template',
                  restorationScopeId: 'app',
                  debugShowCheckedModeBanner: false,
                  themeMode: getIt<AppThemeCubit>().themeMode,
                  theme: AppThemes.lightTheme,
                  darkTheme: AppThemes.darkTheme,
                  initialRoute: AppRoutes.initScreen,
                  onGenerateRoute: AppRouter.generateRoutes,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
