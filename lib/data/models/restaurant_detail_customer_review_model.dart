class RestaurantDetailCustomerReviewModel {
  String name;
  String review;
  final String date;

  RestaurantDetailCustomerReviewModel({
    required this.name,
    required this.review,
    required this.date,
  });

  factory RestaurantDetailCustomerReviewModel.fromJson(
    Map<String, dynamic> json,
  ) => RestaurantDetailCustomerReviewModel(
    name: json['name'] as String,
    review: json['review'] as String,
    date: json['date'] as String,
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'review': review,
    'date': date,
  };
}
