import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant/data/enum/my_workmanager.dart';
import 'package:restaurant/data/services/notification_service.dart';
import 'package:workmanager/workmanager.dart';
import '../services/workmanager_service.dart';
import '../services/shared_preferences_services.dart';

class SchedulingProvider extends ChangeNotifier {
  final SharedPreferencesServices _preferencesServices;
  bool _isScheduled = false;
  bool _isRandomRestaurantNotification = false;

  SchedulingProvider({required SharedPreferencesServices preferencesServices})
    : _preferencesServices = preferencesServices {
    _loadScheduleStatus();
  }

  bool get isScheduled => _isScheduled;
  bool get isRandomRestaurantNotification => _isRandomRestaurantNotification;

  Future<void> _loadScheduleStatus() async {
    _isScheduled = await _preferencesServices.getDailyReminder();
    _isRandomRestaurantNotification =
        await _preferencesServices.getRandomRestaurantNotification();

    notifyListeners();
  }

  Future<void> scheduledRestaurant(bool value) async {
    _isScheduled = value;
    await _preferencesServices.setDailyReminder(value);
    final NotificationService notificationService = NotificationService();
    if (_isScheduled) {
      await notificationService.scheduleNotification(
        0,
        'Lunch Reminder',
        'Saatnya Makan siang, jangan lupa order makanan di aplikasi kami ya!',
      );
    } else {
      await notificationService.cancelNotification(0);
    }
    notifyListeners();
  }

  Future<void> getRandomRestaurantNotification(bool value) async {
    _isRandomRestaurantNotification = value;
    await _preferencesServices.setRandomRestaurantNotification(value);
    if (_isRandomRestaurantNotification) {
      WorkmanagerService().registerTask();
    } else {
      Workmanager().cancelByUniqueName(MyWorkmanager.periodic.uniqueName);
    }
    notifyListeners();
  }
}
