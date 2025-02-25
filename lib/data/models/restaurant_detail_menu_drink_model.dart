class RestaurantDetailMenuDrinkModel {
  final String name;

  RestaurantDetailMenuDrinkModel({required this.name});

  factory RestaurantDetailMenuDrinkModel.fromJson(
    Map<String, dynamic> drinks,
  ) => RestaurantDetailMenuDrinkModel(name: drinks['name'] as String);

  Map<String, dynamic> toMap() => {'name': name};
}
