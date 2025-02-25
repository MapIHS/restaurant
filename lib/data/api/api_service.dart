import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant/data/models/add_review_response_model.dart';
import 'package:restaurant/data/models/get_restauran_detail_model.dart';
import 'package:restaurant/data/models/get_restaurant_list_model.dart';
import 'package:restaurant/data/models/search_restaurant_model.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev';

  final http.Client client;
  ApiService({required this.client});

  Future<GetRestaurantListModel> getListRestaurant() async {
    final response = await client.get(Uri.parse('$_baseUrl/list'));
    if (response.statusCode == 200) {
      return GetRestaurantListModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get list restaurant');
    }
  }

  Future<SearchRestaurantModel> searchRestaurant(String keyw) async {
    final response = await client.get(Uri.parse('$_baseUrl/search?q=$keyw'));
    if (response.statusCode == 200) {
      return SearchRestaurantModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search restaurant');
    }
  }

  Future<GetRestauranDetailModel> getDetailRestaurant(id) async {
    final response = await client.get(Uri.parse('$_baseUrl/detail/$id'));
    if (response.statusCode == 200) {
      return GetRestauranDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get detail restaurant');
    }
  }

  Future<AddReviewResponseModel> addReview(
    String restaurantId,
    String name,
    String review,
  ) async {
    final response = await client.post(
      Uri.parse('$_baseUrl/review'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': restaurantId,
        'name': name,
        'review': review,
      }),
    );

    if (response.statusCode == 201) {
      return AddReviewResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add review');
    }
  }
}
