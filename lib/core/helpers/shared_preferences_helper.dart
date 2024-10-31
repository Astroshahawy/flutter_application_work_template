import 'dart:async';

import '../src/app_export.dart';

class SharedPreferencesHelper {
  static SharedPreferences? sharedPreferences;

  static void init() {
    debugPrint('SharedPreferencesHelper: initialized ✅');
    sharedPreferences = getIt<SharedPreferences>();
  }

  static dynamic getData({required String key}) {
    debugPrint('SharedPreferencesHelper: data with key: $key has been got ✅');
    return sharedPreferences?.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is List<String>) {
      return await sharedPreferences!.setStringList(key, value);
    }
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    debugPrint(
        'SharedPreferencesHelper: data with key: $key and value: $value ( ${value.runtimeType} ) has been set ✅');
    return await sharedPreferences!.setDouble(key, value);
  }

  static Future<bool> removeData({required String key}) async {
    debugPrint('SharedPreferencesHelper: data with key: $key has been removed');
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> clearAllData() async {
    debugPrint('SharedPreferencesHelper: all data has been cleared');
    return await sharedPreferences!.clear();
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString({required String key, required String value}) async {
    debugPrint(
        'FlutterSecureStorage: setSecuredString with key: $key and value: $value');
    await getIt<FlutterSecureStorage>().write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    debugPrint('FlutterSecureStorage: getSecuredString with key: $key');
    return await getIt<FlutterSecureStorage>().read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: all data has been cleared');
    await getIt<FlutterSecureStorage>().deleteAll();
  }
}
