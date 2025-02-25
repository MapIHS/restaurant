import 'package:restaurant/data/models/restaurant_model.dart';

class SearchRestaurantModel {
  final bool error;
  final int founded;
  final List<RestaurantModel> restaurants;

  SearchRestaurantModel({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory SearchRestaurantModel.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantModel(
        error: json['error'],
        founded: json['founded'],
        restaurants: List<RestaurantModel>.from(
          (json['restaurants'] as List).map((e) => RestaurantModel.fromJson(e)),
        ),
      );

  Map<String, dynamic> toMap() => {
    'error': error,
    'founded': founded,
    'restaurants': List<dynamic>.from(restaurants.map((e) => e.toMap())),
  };
}
