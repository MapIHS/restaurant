import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/models/get_restauran_detail_model.dart';
import 'package:restaurant/data/provider/restaurant_detail_provider.dart';
import '../restaurant_provider/restaurant_provider_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  final mockApiService = MockApiService();

  testWidgets('getRestaurantDetail should be success', (tester) async {
    final restaurantDetailProvider = RestaurantDetailProvider(
      apiService: mockApiService,
    );
    var restaurantId = 'rqdv5juczeskfw1e867';
    Map<String, dynamic> expectedResult = {
      "error": false,
      "message": "success",
      "restaurant": {
        "id": "rqdv5juczeskfw1e867",
        "name": "Melting Pot",
        "description":
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...",
        "city": "Medan",
        "address": "Jln. Pandeglang no 19",
        "pictureId": "14",
        "categories": [
          {"name": "Italia"},
          {"name": "Modern"},
        ],
        "menus": {
          "foods": [
            {"name": "Paket rosemary"},
            {"name": "Toastie salmon"},
          ],
          "drinks": [
            {"name": "Es krim"},
            {"name": "Sirup"},
          ],
        },
        "rating": 4.2,
        "customerReviews": [
          {
            "name": "Ahmad",
            "review": "Tidak rekomendasi untuk pelajar!",
            "date": "13 November 2019",
          },
        ],
      },
    };

    when(
      mockApiService.getDetailRestaurant(restaurantId),
    ).thenAnswer((_) async => GetRestauranDetailModel.fromJson(expectedResult));

    await restaurantDetailProvider.fetchRestaurantDetail(restaurantId);
    final actualResult = restaurantDetailProvider.restaurantDetail;

    expect(restaurantDetailProvider.state, ResultState.hasData);
    expect(actualResult!.id, expectedResult['restaurant']?['id']);
    expect(actualResult.name, expectedResult['restaurant']?['name']);
    expect(
      actualResult.description,
      expectedResult['restaurant']['description'],
    );
    expect(actualResult.city, expectedResult['restaurant']?['city']);
    expect(actualResult.address, expectedResult['restaurant']?['address']);
    expect(actualResult.pictureId, expectedResult['restaurant']?['pictureId']);
    expect(actualResult.rating, expectedResult['restaurant']?['rating']);
    expect(
      actualResult.categories.length,
      expectedResult['restaurant']?['categories']?.length,
    );
    expect(
      actualResult.menus.foods.length,
      expectedResult['restaurant']?['menus']?['foods']?.length,
    );
    expect(
      actualResult.menus.drinks.length,
      expectedResult['restaurant']?['menus']?['drinks']?.length,
    );
    expect(
      actualResult.customerReviews.length,
      expectedResult['restaurant']?['customerReviews']?.length,
    );
  });

  testWidgets('getRestaurantDetail should be failed', (tester) async {
    final restaurantDetailProvider = RestaurantDetailProvider(
      apiService: mockApiService,
    );
    var restaurantId = 'invalid_id';

    when(
      mockApiService.getDetailRestaurant(restaurantId),
    ).thenThrow(Exception('Failed to load'));

    await restaurantDetailProvider.fetchRestaurantDetail(restaurantId);
    final actualResult = restaurantDetailProvider.restaurantDetail;

    expect(restaurantDetailProvider.state, ResultState.error);
    expect(actualResult, isNull);
  });
}
