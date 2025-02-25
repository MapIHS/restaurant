import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/models/search_restaurant_model.dart';
import 'package:restaurant/data/provider/search_restaurant_provider.dart';
import '../restaurant_provider/restaurant_provider_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  final mockApiService = MockApiService();

  testWidgets('searchRestaurant should be success', (tester) async {
    final restaurantSearchProvider = SearchRestaurantProvider(
      apiService: mockApiService,
    );
    var query = 'Makan mudah';
    Map<String, dynamic> expectedResult = {
      "error": false,
      "founded": 1,
      "restaurants": [
        {
          "id": "fnfn8mytkpmkfw1e867",
          "name": "Makan mudah",
          "description":
              "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...",
          "pictureId": "22",
          "city": "Medan",
          "rating": 3.7,
        },
      ],
    };

    when(
      mockApiService.searchRestaurant(query),
    ).thenAnswer((_) async => SearchRestaurantModel.fromJson(expectedResult));

    await restaurantSearchProvider.searchRestaurant(query);
    final actualResult = restaurantSearchProvider.restaurants;

    expect(restaurantSearchProvider.state, ResultState.hasData);
    expect(actualResult.length, expectedResult['restaurants']?.length);
    expect(actualResult[0].id, expectedResult['restaurants']?[0]['id']);
    expect(actualResult[0].name, expectedResult['restaurants']?[0]['name']);
    expect(
      actualResult[0].description,
      expectedResult['restaurants']?[0]['description'],
    );
    expect(
      actualResult[0].pictureId,
      expectedResult['restaurants']?[0]['pictureId'],
    );
    expect(actualResult[0].city, expectedResult['restaurants']?[0]['city']);
    expect(actualResult[0].rating, expectedResult['restaurants']?[0]['rating']);
  });

  testWidgets('searchRestaurant should be failed', (tester) async {
    final restaurantSearchProvider = SearchRestaurantProvider(
      apiService: mockApiService,
    );
    var query = 'invalid_query';

    when(
      mockApiService.searchRestaurant(query),
    ).thenThrow(Exception('Failed to load'));

    await restaurantSearchProvider.searchRestaurant(query);
    final actualResult = restaurantSearchProvider.restaurants;

    expect(restaurantSearchProvider.state, ResultState.error);
    expect(actualResult, isEmpty);
  });
}
