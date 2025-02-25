import 'package:restaurant/data/models/restaurant_detail_menu_drink_model.dart';
import 'package:restaurant/data/models/restaurant_detail_menu_food_model.dart';

class RestaurantDetailMenuModel {
  final List<RestaurantDetailMenuFoodModel> foods;
  final List<RestaurantDetailMenuDrinkModel> drinks;

  RestaurantDetailMenuModel({required this.foods, required this.drinks});

  factory RestaurantDetailMenuModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailMenuModel(
        foods: List<RestaurantDetailMenuFoodModel>.from(
          (json['foods'] as List).map(
            (e) => RestaurantDetailMenuFoodModel.fromJson(e),
          ),
        ),
        drinks: List<RestaurantDetailMenuDrinkModel>.from(
          (json['drinks'] as List).map(
            (e) => RestaurantDetailMenuDrinkModel.fromJson(e),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
    'foods': List<dynamic>.from(foods.map((e) => e.toMap())),
    'drinks': List<dynamic>.from(drinks.map((e) => e.toMap())),
  };
}
