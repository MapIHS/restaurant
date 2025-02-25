import 'package:flutter/material.dart';
import 'package:restaurant/data/api/api_service.dart';
import '../models/restaurant_model.dart';

enum ResultState { loading, noData, hasData, error }

class RestaurantProvider with ChangeNotifier {
  final ApiService apiService;

  late List<RestaurantModel> _restaurants;
  late ResultState _state;
  String _message = 'No Message';

  List<RestaurantModel> get restaurants => _restaurants;
  ResultState get state => _state;
  String get message => _message;

  RestaurantProvider({required this.apiService}) {
    _restaurants = [];
  }

  Future<void> getAllRestaurants() async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      final restaurantList = await apiService.getListRestaurant();
      if (restaurantList.restaurants.isEmpty) {
        _state = ResultState.noData;
        _message = 'Tidak ada data tersedia';
      } else {
        _state = ResultState.hasData;
        _restaurants = restaurantList.restaurants;
      }
    } catch (e) {
      _state = ResultState.error;
      _message = 'Terjadi kesalahan. Pastikan Anda terhubung ke internet.';
    }
    notifyListeners();
  }
}
