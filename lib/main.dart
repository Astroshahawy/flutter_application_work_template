import 'dart:async';

import 'core/exceptions/error_logger.dart';
import 'core/src/app.dart';
import 'core/src/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initGetIt();
  SharedPreferencesHelper.init();
  Bloc.observer = AppBlocObserver();

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((value) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Platform.isIOS ? Brightness.light : Brightness.dark,
      ),
    );

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
      logFlutterErrors(details);
    };

    runZonedGuarded(
      () {
        runApp(const MyApp());
      },
      (error, stack) {
        logDartErrors(error, stack);
      },
    );
  });
}
