import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPrefrencess {
  static SharedPreferences? preferences;
  static String isFirstTime = 'isFirstTime';
  static Future initSP() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future setIsFirst(bool yes) async {
    final isFirst = await preferences!.setBool(isFirstTime, yes);
    print(isFirst);
  }

  static bool? getFirstTime() {
    final getfirsttime = preferences!.getBool(isFirstTime);
    return getfirsttime;
  }
}
