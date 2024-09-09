import 'package:shop_deal/core/utils/contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static late SharedPreferences pref;
  static late bool isLoggedIn;
  static late bool isDarkMode;
  static late String currentlanguage;
  static Future init() async {
    pref = await SharedPreferences.getInstance();
    isLoggedIn = pref.getBool(isLoggedInKey) ?? false;
    kIsDarkMode = isDarkMode = pref.getBool(themeModeKey) ?? false;
    kCurrentLanguage = currentlanguage = pref.getString(languageKey) ?? "en";
  }

  static bool getBoolean({required String key}) {
    return pref.getBool(key)!;
  }

  static Future<void> setBoolean(
      {required String key, required bool value}) async {
    await pref.setBool(key, value).then((value) {
      isLoggedIn = value;
    }).catchError((error) {});
  }

  static String getString({required String key}) {
    return pref.getString(key)!;
  }

  static Future<void> setString(
      {required String key, required String value}) async {
    await pref.setString(key, value);
  }
}
