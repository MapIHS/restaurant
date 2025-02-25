import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/models/get_restaurant_list_model.dart';
import 'package:restaurant/data/provider/restaurant_provider.dart';

import 'restaurant_provider_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  final mockApiService = MockApiService();

  testWidgets('RestaurantProvider should be success', (tester) async {
    final restaurantProvider = RestaurantProvider(apiService: mockApiService);
    var expectedResult = {
      "error": false,
      "message": "success",
      "count": 20,
      "restaurants": [
        {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description":
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
          "pictureId": "14",
          "city": "Medan",
          "rating": 4.2,
        },
        {
          "id": "s1knt6za9kkfw1e867",
          "name": "Kafe Kita",
          "description":
              "Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. ...",
          "pictureId": "25",
          "city": "Gorontalo",
          "rating": 4,
        },
      ],
    };

    when(
      mockApiService.getListRestaurant(),
    ).thenAnswer((_) async => GetRestaurantListModel.fromJson(expectedResult));

    await restaurantProvider.getAllRestaurants();
    final actualResult = restaurantProvider.restaurants;

    expect(restaurantProvider.state, ResultState.hasData);
    expect(actualResult.length, (expectedResult['restaurants'] as List).length);
  });

  testWidgets('RestaurantProvider should be failed', (tester) async {
    final restaurantProvider = RestaurantProvider(apiService: mockApiService);

    when(
      mockApiService.getListRestaurant(),
    ).thenThrow(Exception('Failed to fetch data'));

    await restaurantProvider.getAllRestaurants();
    final actualResult = restaurantProvider.restaurants;

    expect(restaurantProvider.state, ResultState.error);
    expect(actualResult, isEmpty);
  });
}
