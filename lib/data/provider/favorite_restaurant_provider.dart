import 'package:flutter/material.dart';
import '../services/database_service.dart';
import '../models/restaurant_model.dart';

class FavoriteRestaurantProvider with ChangeNotifier {
  final DatabaseService databaseService;

  FavoriteRestaurantProvider({required this.databaseService}) {
    _getFavorites();
  }

  List<RestaurantModel> _favorites = [];
  List<RestaurantModel> get favorites => _favorites;

  Future<void> _getFavorites() async {
    _favorites = await databaseService.getFavorites();
    notifyListeners();
  }

  Future<void> addFavorite(RestaurantModel restaurant) async {
    await databaseService.insertFavorite(restaurant);
    _getFavorites();
  }

  Future<void> removeFavorite(String id) async {
    await databaseService.deleteFavorite(id);
    _getFavorites();
  }

  bool isFavorite(String id) {
    return _favorites.any((restaurant) => restaurant.id == id);
  }
}
