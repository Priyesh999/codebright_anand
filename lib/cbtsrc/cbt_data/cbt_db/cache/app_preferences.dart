import 'package:shared_preferences/shared_preferences.dart';

class AppPrefrence {
  SharedPreferences? prefs;

  static final AppPrefrence _instance = AppPrefrence._();

  AppPrefrence._();

  factory AppPrefrence() => AppPrefrence._instance;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  //------------------------------------------------- BOOLEAN --------------------------------------------------------------------
  bool getBoolean(String key)  {
    if (prefs == null) {
      return false;
    }
    return prefs!.getBool(key) ?? false;
  }


  Future<bool> setBoolean(String key, bool value) async {
    if (prefs == null) {
      return false;
    }
    return await prefs!.setBool(key, value);
  }

  //------------------------------------------------- STRING ---------------------------------------------------------------------
  String getString(String key)  {
    if (prefs == null) {
      return "";
    }
    return prefs!.getString(key) ?? "";
  }

  Future<bool> setString(String key, String value) async {
    if (prefs == null) {
      return false;
    }
    return await prefs!.setString(key, value);
  }

  //------------------------------------------------- INT ------------------------------------------------------------------------
  int getInt(String key)  {
    if (prefs == null) {
      return -1;
    }

    return prefs!.getInt(key) ?? 0;
  }

  Future<bool> setInt(String key, int value) async {
    if (prefs == null) {
      return false;
    }
    return await prefs!.setInt(key, value);
  }

  //------------------------------------------------- DOUBLE ---------------------------------------------------------------------

  Future<bool> setDouble(String key, double value) async {
    if (prefs == null) {
      return false;
    }
    return await prefs!.setDouble(key, value);
  }

  double getDouble(String key)  {
    if (prefs == null) {
      return 0;
    }
    return prefs!.getDouble(key) ?? 0.0;
  }

  //------------------------------------------------- CLEAR ALL ------------------------------------------------------------------
  Future<void> clearPreference() async {
    if (prefs == null) {
      return;
    }
    await prefs!.clear();
  }

  //------------------------------------------------- REMOVE ---------------------------------------------------------------------
  static void removePreference(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

