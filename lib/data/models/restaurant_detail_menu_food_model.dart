class RestaurantDetailMenuFoodModel {
  final String name;

  RestaurantDetailMenuFoodModel({required this.name});

  factory RestaurantDetailMenuFoodModel.fromJson(Map<String, dynamic> foods) =>
      RestaurantDetailMenuFoodModel(name: foods['name'] as String);

  Map<String, dynamic> toMap() => {'name': name};
}
