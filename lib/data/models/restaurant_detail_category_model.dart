class RestaurantDetailCategoryModel {
  final String name;

  RestaurantDetailCategoryModel({required this.name});

  factory RestaurantDetailCategoryModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailCategoryModel(name: json['name'] as String);

  Map<String, dynamic> toMap() => {'name': name};
}
