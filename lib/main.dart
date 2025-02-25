import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/data/provider/favorite_restaurant_provider.dart';
import 'package:restaurant/data/provider/scheduling_provider.dart';
import 'package:restaurant/data/provider/theme_provider.dart';
import 'package:restaurant/data/services/workmanager_service.dart';
import 'package:restaurant/data/services/database_service.dart';
import 'package:restaurant/data/services/notification_service.dart';
import 'package:restaurant/data/services/shared_preferences_services.dart';
import 'package:restaurant/routes/app_page.dart';
import 'package:restaurant/routes/app_route.dart';
import 'package:restaurant/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationService notificationService = NotificationService();
  await notificationService.initNotification();
  WorkmanagerService().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create:
              (_) => FavoriteRestaurantProvider(
                databaseService: DatabaseService(),
              ),
        ),
        ChangeNotifierProvider(
          create:
              (_) => SchedulingProvider(
                preferencesServices: SharedPreferencesServices(),
              ),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            title: 'Restaurant App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            initialRoute: AppRoute.homeScreen,
            routes: AppPage.routes,
          );
        },
      ),
    );
  }
}
