import 'package:shared_preferences/shared_preferences.dart';

class SharePrefService {
  static Future<void> setSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("seen", true);
  }

  static Future<bool> getSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("seen") ?? false;
  }

  static Future<void> settheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();

    if (theme == "light") {
      await prefs.setString("theme", "light");
    } else if (theme == "dark") {
      await prefs.setString("theme", "dark");
    }
  }

  static Future<String> gettheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("theme") ?? "light";
  }

  static Future<void> setlanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();

    if (language == "en") {
      await prefs.setString("language", "en");
    } else if (language == "ar") {
      await prefs.setString("language", "ar");
    }
  }

  static Future<String> getlanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("language") ?? "en";
  }
}
