import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Prefs{
  static late SharedPreferences _instance;

  Prefs._internal();

  static Future<void> init() async {
    _instance = await SharedPreferences.getInstance();

  }

  static Future<void> setBool(String key, bool value) async {
    await _instance.setBool(key, value);
  }
  static bool getBool(String key) {
    return _instance.getBool(key) ?? false;
  }
    static setString(String key, String value) async {
    await _instance.setString(key, value);
  }

  static getString(String key) {
    return _instance.getString(key) ?? "";
  }
static Future<void> saveUserIdToPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = Supabase.instance.client.auth.currentUser?.id;
  if (userId != null) {
    await prefs.setString('user_id', userId);
  }
}
static Future<void> saveUsernameToPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final username = Supabase.instance.client.auth.currentUser?.userMetadata!['name'];
  if (username != null) {
    await prefs.setString('username', username);
  }
}
}