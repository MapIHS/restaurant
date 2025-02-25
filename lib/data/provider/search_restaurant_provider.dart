import 'package:flutter/material.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/models/restaurant_model.dart';

enum ResultState { loading, noData, hasData, error }

class SearchRestaurantProvider with ChangeNotifier {
  final ApiService apiService;

  late List<RestaurantModel> _restaurants;
  late ResultState _state;
  String _message = 'No Message';

  List<RestaurantModel> get restaurants => _restaurants;
  ResultState get state => _state;
  String get message => _message;

  SearchRestaurantProvider({required this.apiService}) {
    _state = ResultState.noData;
    _restaurants = [];
  }

  Future<void> searchRestaurant(String query) async {
    if (query.isEmpty) return;

    _state = ResultState.loading;
    notifyListeners();

    try {
      final searchResult = await apiService.searchRestaurant(query);
      if (searchResult.restaurants.isEmpty) {
        _state = ResultState.noData;
        _message = 'Tidak ada data tersedia';
      } else {
        _state = ResultState.hasData;
        _restaurants = searchResult.restaurants;
      }
    } catch (e) {
      _state = ResultState.error;
      _message = 'Terjadi kesalahan. Pastikan Anda terhubung ke internet.';
    }
    notifyListeners();
  }
}
