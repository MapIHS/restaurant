import 'package:restaurant/data/models/restaurant_detail_model.dart';

class GetRestauranDetailModel {
  final bool error;
  final String message;
  final RestaurantDetailModel restaurant;

  GetRestauranDetailModel({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory GetRestauranDetailModel.fromJson(Map<String, dynamic> json) =>
      GetRestauranDetailModel(
        error: json['error'],
        message: json['message'],
        restaurant: RestaurantDetailModel.fromJson(json['restaurant']),
      );

  Map<String, dynamic> toMap() => {
    'error': error,
    'message': message,
    'restaurant': restaurant.toMap(),
  };
}
