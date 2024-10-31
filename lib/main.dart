import 'dart:async';

import 'core/exceptions/error_logger.dart';
import 'core/src/app.dart';
import 'core/src/app_export.dart';

Future<void> main() async {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await initGetIt();
      SharedPreferencesHelper.init();
      Bloc.observer = AppBlocObserver();

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

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

      runApp(const MyApp());
    },
    (error, stack) {
      logDartErrors(error, stack);
    },
  );
}
