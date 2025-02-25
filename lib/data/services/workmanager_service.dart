import 'package:http/http.dart' as http;
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/enum/my_workmanager.dart';
import 'package:restaurant/data/models/get_restaurant_list_model.dart';
import 'package:restaurant/data/services/notification_service.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class WorkmanagerService {
  final Workmanager _workmanager;

  WorkmanagerService([Workmanager? workmanager])
    : _workmanager = workmanager ??= Workmanager();

  Future<void> init() async {
    tz.initializeTimeZones();
    await _workmanager.initialize(callbackDispatcher, isInDebugMode: true);
  }

  Future<void> registerTask() async {
    final now = tz.TZDateTime.now(tz.getLocation('Asia/Jakarta'));
    final targetTime = tz.TZDateTime(
      tz.getLocation('Asia/Jakarta'),
      now.year,
      now.month,
      now.day,
      11,
    );
    final initialDelay =
        targetTime.isBefore(now)
            ? targetTime.add(Duration(days: 1)).difference(now)
            : targetTime.difference(now);

    await _workmanager.registerPeriodicTask(
      MyWorkmanager.periodic.uniqueName,
      MyWorkmanager.periodic.taskName,
      frequency: const Duration(hours: 24),
      constraints: Constraints(networkType: NetworkType.connected),
      initialDelay: initialDelay,
    );
  }
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == MyWorkmanager.periodic.taskName) {
      final NotificationService notificationService = NotificationService();
      final GetRestaurantListModel restaurants =
          await ApiService(client: http.Client()).getListRestaurant();
      await notificationService.showNotification(restaurants);
    }

    return Future.value(true);
  });
}
