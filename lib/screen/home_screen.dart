import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/provider/restaurant_provider.dart';
import 'package:restaurant/data/provider/theme_provider.dart';
import 'package:restaurant/data/services/notification_service.dart';
import 'package:restaurant/routes/app_route.dart';
import 'package:restaurant/screen/widget/favorite_list_widget.dart';
import 'package:restaurant/screen/widget/restaurant_list_widget.dart';
import 'package:restaurant/screen/widget/setting_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final NotificationService _notificationService = NotificationService();

  static final List<Widget> _pages = <Widget>[
    ChangeNotifierProvider(
      create:
          (_) =>
              RestaurantProvider(apiService: ApiService(client: http.Client()))
                ..getAllRestaurants(),
      child: RestaurantListWidget(),
    ),
    FavoriteListWidget(),
    SettingWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
        actions: _buildIcon(context),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Restaurants'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  List<Widget> _buildIcon(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.searchScreen);
        },
      ),
      Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              themeProvider.toggleTheme();
            },
          );
        },
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _notificationService.configureSelectNotificationSubject(
      context,
      AppRoute.detailScreen,
    );
  }

  @override
  void dispose() {
    selectNotificationSubject.close();
    super.dispose();
  }
}
