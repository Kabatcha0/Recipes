import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static late SharedPreferences sharedPreferences;
  static Future<SharedPreferences> init() async {
    return sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBoolMode({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBoolMode({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
