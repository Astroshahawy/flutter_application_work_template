import 'core/helpers/cache_helper.dart';
import 'core/src/app.dart';
import 'core/src/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  initGetIt();
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
    runApp(const MyApp());
  });
}
