import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> setCacheLanguageCode(String languageCode) async {
    final sharedPreference = await SharedPreferences.getInstance();
    sharedPreference.setString("LOCALE", languageCode);
  }

  Future<String?> getCacheLanguageCode() async {
    final sharedPreference = await SharedPreferences.getInstance();
    String? locale = sharedPreference.getString("LOCALE");
    if (locale != null && locale.isNotEmpty) {
      return locale;
    } else {
      return "en";
    }
  }
}
