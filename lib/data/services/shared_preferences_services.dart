import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static const String themeKey = 'isDarkMode';
  static const String reminderKey = 'isDailyReminderEnabled';
  static const String randomRestaurantNotificationKey =
      'isRandomRestaurantNotificationEnabled';

  Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeKey) ?? false;
  }

  Future<void> setTheme(bool isDarkMode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, isDarkMode);
  }

  Future<bool> getDailyReminder() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(reminderKey) ?? false;
  }

  Future<void> setDailyReminder(bool isEnabled) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(reminderKey, isEnabled);
  }

  Future<bool> getRandomRestaurantNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(randomRestaurantNotificationKey) ?? false;
  }

  Future<void> setRandomRestaurantNotification(bool isEnabled) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(randomRestaurantNotificationKey, isEnabled);
  }
}
