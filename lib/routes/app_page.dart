import 'package:flutter/material.dart';
import 'package:restaurant/screen/detail_screen.dart';
import 'package:restaurant/screen/home_screen.dart';
import 'package:restaurant/routes/app_route.dart';
import 'package:restaurant/screen/search_screen.dart';

class AppPage {
  static Map<String, WidgetBuilder> routes = {
    AppRoute.homeScreen: (context) => const HomeScreen(),
    AppRoute.detailScreen: (context) {
      final args = ModalRoute.of(context)!.settings.arguments as String;
      return DetailScreen(restaurantId: args);
    },
    AppRoute.searchScreen: (context) => const SearchScreen(),
  };
}
