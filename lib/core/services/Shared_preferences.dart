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
static Future<void> saveUserIdToPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  final userId = Supabase.instance.client.auth.currentUser?.id;
  if (userId != null) {
    await prefs.setString('user_id', userId);
  }
}
}