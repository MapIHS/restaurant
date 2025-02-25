import 'package:restaurant/data/models/restaurant_detail_category_model.dart';
import 'package:restaurant/data/models/restaurant_detail_customer_review_model.dart';
import 'package:restaurant/data/models/restaurant_detail_menu_model.dart';

class RestaurantDetailModel {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<RestaurantDetailCategoryModel> categories;
  final RestaurantDetailMenuModel menus;
  final double rating;
  List<RestaurantDetailCustomerReviewModel> customerReviews;

  RestaurantDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        address: json['address'],
        pictureId: json['pictureId'],
        categories: List<RestaurantDetailCategoryModel>.from(
          (json['categories'] as List).map(
            (e) => RestaurantDetailCategoryModel.fromJson(e),
          ),
        ),
        menus: RestaurantDetailMenuModel.fromJson(json['menus']),
        rating: json['rating'].toDouble(),
        customerReviews: List<RestaurantDetailCustomerReviewModel>.from(
          (json['customerReviews'] as List).map(
            (e) => RestaurantDetailCustomerReviewModel.fromJson(e),
          ),
        ),
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'description': description,
    'city': city,
    'address': address,
    'pictureId': pictureId,
    'categories': List<dynamic>.from(categories.map((e) => e.toMap())),
    'menus': menus.toMap(),
    'rating': rating,
    'customerReviews': List<dynamic>.from(
      customerReviews.map((e) => e.toMap()),
    ),
  };
}
