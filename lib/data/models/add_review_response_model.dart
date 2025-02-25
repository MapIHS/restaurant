import 'restaurant_detail_customer_review_model.dart';

class AddReviewResponseModel {
  final bool error;
  final String message;
  final List<RestaurantDetailCustomerReviewModel> customerReviews;

  AddReviewResponseModel({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  factory AddReviewResponseModel.fromJson(Map<String, dynamic> json) {
    return AddReviewResponseModel(
      error: json['error'],
      message: json['message'],
      customerReviews:
          (json['customerReviews'] as List)
              .map((i) => RestaurantDetailCustomerReviewModel.fromJson(i))
              .toList(),
    );
  }
}
