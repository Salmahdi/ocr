import 'package:shared_preferences/shared_preferences.dart';

class LanguageCachedHelper {
  // Cache Lang
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferance = await SharedPreferences.getInstance();
    sharedPreferance.setString('locale', languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final sharedPreferance = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferance.getString('locale');
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return 'en';
    }
  }
}
