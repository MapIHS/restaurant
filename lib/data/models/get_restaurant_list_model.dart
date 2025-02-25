import 'package:restaurant/data/models/restaurant_model.dart';

class GetRestaurantListModel {
  final bool error;
  final String message;
  final int count;
  final List<RestaurantModel> restaurants;

  GetRestaurantListModel({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory GetRestaurantListModel.fromJson(Map<String, dynamic> json) =>
      GetRestaurantListModel(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<RestaurantModel>.from(
          (json['restaurants'] as List).map((e) => RestaurantModel.fromJson(e)),
        ),
      );

  Map<String, dynamic> toMap() => {
    'error': error,
    'message': message,
    'count': count,
    'restaurants': List<dynamic>.from(restaurants.map((e) => e.toMap())),
  };
}
