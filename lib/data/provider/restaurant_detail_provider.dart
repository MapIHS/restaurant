import 'package:flutter/material.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/models/restaurant_detail_model.dart';

enum ResultState { loading, noData, hasData, error }

enum ReviewState { idle, loading, success, error }

class RestaurantDetailProvider with ChangeNotifier {
  final ApiService apiService;

  RestaurantDetailModel? _restaurantDetail;
  late ResultState _state;
  late ReviewState _reviewState;
  String _message = '';
  String _reviewMessage = '';

  RestaurantDetailModel? get restaurantDetail => _restaurantDetail;
  ResultState get state => _state;
  ReviewState get reviewState => _reviewState;
  String get message => _message;
  String get reviewMessage => _reviewMessage;

  RestaurantDetailProvider({required this.apiService}) {
    _state = ResultState.loading;
    _reviewState = ReviewState.idle;
  }

  Future<void> fetchRestaurantDetail(String id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final restaurantDetail = await apiService.getDetailRestaurant(id);
      if (restaurantDetail.error) {
        _state = ResultState.noData;
        _message = 'Data tidak ditemukan';
      } else {
        _state = ResultState.hasData;
        _restaurantDetail = restaurantDetail.restaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      _message = 'Terjadi kesalahan. Pastikan Anda terhubung ke internet.';
      _restaurantDetail = null; // Ensure _restaurantDetail is null on error
    }
    notifyListeners();
  }

  Future<void> addReview(
    String restaurantId,
    String name,
    String review,
  ) async {
    try {
      _reviewState = ReviewState.loading;
      notifyListeners();
      final response = await apiService.addReview(restaurantId, name, review);
      if (!response.error) {
        _restaurantDetail?.customerReviews = response.customerReviews;
        _reviewState = ReviewState.success;
        notifyListeners();
      } else {
        _reviewMessage = 'Gagal menambahkan review';
        _reviewState = ReviewState.error;
        notifyListeners();
      }
    } catch (e) {
      _reviewMessage =
          'Terjadi kesalahan. Pastikan Anda terhubung ke internet.';
      _reviewState = ReviewState.error;
      notifyListeners();
    }
  }
}
