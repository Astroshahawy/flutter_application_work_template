import '../src/app_export.dart';

void logFlutterErrors(FlutterErrorDetails details) {
  debugPrint('Flutter error: ${details.exception}');
  debugPrint('Stack trace: ${details.stack}');
}

void logDartErrors(Object error, StackTrace stackTrace) {
  debugPrint('Dart error: $error');
  debugPrint('Stack trace: $stackTrace');
}
