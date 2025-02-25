import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant/data/models/get_restauran_detail_model.dart';
import 'package:restaurant/data/models/get_restaurant_list_model.dart';
import 'package:restaurant/data/models/restaurant_detail_category_model.dart';
import 'package:restaurant/data/models/restaurant_detail_customer_review_model.dart';
import 'package:restaurant/data/models/restaurant_detail_menu_drink_model.dart';
import 'package:restaurant/data/models/restaurant_detail_menu_food_model.dart';
import 'package:restaurant/data/models/restaurant_detail_menu_model.dart';
import 'package:restaurant/data/models/restaurant_detail_model.dart';
import 'package:restaurant/data/models/restaurant_model.dart';
import 'package:restaurant/data/models/search_restaurant_model.dart';

void main() {
  group('Parse All Responses', () {
    group('Parse GetRestaurantListModel', () {
      group('Parse RestaurantModel', () {
        var restaurantJson = {
          "id": "rqdv5juczeskfw1e867",
          "name": "Melting Pot",
          "description":
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
          "pictureId": "14",
          "city": "Medan",
          "rating": 4.2,
        };

        test('Should parse RestaurantModel from json', () {
          var parsedResult = RestaurantModel.fromJson(restaurantJson);
          expect(parsedResult.id, 'rqdv5juczeskfw1e867');
          expect(parsedResult.name, 'Melting Pot');
          expect(
            parsedResult.description,
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...',
          );
          expect(parsedResult.pictureId, '14');
          expect(parsedResult.city, 'Medan');
          expect(parsedResult.rating, 4.2);
        });

        test('Should parse RestaurantModel to json', () {
          var parsedResult = RestaurantModel.fromJson(restaurantJson).toMap();
          expect(parsedResult, restaurantJson);
          expect(parsedResult['id'], 'rqdv5juczeskfw1e867');
          expect(parsedResult['name'], 'Melting Pot');
          expect(
            parsedResult['description'],
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...',
          );
          expect(parsedResult['pictureId'], '14');
          expect(parsedResult['city'], 'Medan');
          expect(parsedResult['rating'], 4.2);
        });
      });

      group('Parse GetRestaurantListModel', () {
        var restaurantListJson = {
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
        test('Should parse GetRestaurantListModel from json', () {
          var parsedResult = GetRestaurantListModel.fromJson(
            restaurantListJson,
          );
          expect(parsedResult.error, false);
          expect(parsedResult.message, 'success');
          expect(parsedResult.count, 20);
          expect(parsedResult.restaurants.length, 2);
        });
        test('Should parse GetRestaurantListModel to json', () {
          var parsedResult =
              GetRestaurantListModel.fromJson(restaurantListJson).toMap();
          expect(parsedResult, restaurantListJson);
          expect(parsedResult['error'], false);
          expect(parsedResult['message'], 'success');
          expect(parsedResult['count'], 20);
          expect(parsedResult['restaurants']?.length, 2);
        });
      });
    });
    group('Parse GetRestaurantListModel', () {
      group('Parse RestaurantDetailCustomerReviewModel', () {
        var reviewJson = {
          "name": "Ahmad",
          "review": "Tidak rekomendasi untuk pelajar!",
          "date": "13 November 2019",
        };
        test('Should parse CustomerReviewResponse from json', () {
          var parsedResult = RestaurantDetailCustomerReviewModel.fromJson(
            reviewJson,
          );
          expect(parsedResult.name, 'Ahmad');
          expect(parsedResult.review, 'Tidak rekomendasi untuk pelajar!');
          expect(parsedResult.date, '13 November 2019');
        });

        test('Should parse RestaurantDetailCustomerReviewModel to json', () {
          var parsedResult =
              RestaurantDetailCustomerReviewModel.fromJson(reviewJson).toMap();
          expect(parsedResult, reviewJson);
          expect(parsedResult['name'], 'Ahmad');
          expect(parsedResult['review'], 'Tidak rekomendasi untuk pelajar!');
          expect(parsedResult['date'], '13 November 2019');
        });
      });
      group('Parse RestaurantDetailMenuDrinkModel', () {
        var drinkJson = {"name": "Es krim"};
        test('Should parse RestaurantDetailMenuDrinkModel from json', () {
          var parsedResult = RestaurantDetailMenuDrinkModel.fromJson(drinkJson);
          expect(parsedResult.name, 'Es krim');
        });

        test('Should parse RestaurantDetailMenuDrinkModel to json', () {
          var parsedResult =
              RestaurantDetailMenuDrinkModel.fromJson(drinkJson).toMap();
          expect(parsedResult, drinkJson);
          expect(parsedResult['name'], 'Es krim');
        });
      });
      group('Parse RestaurantDetailMenuFoodModel', () {
        var foodJson = {"name": "Toastie salmon"};
        test('Should parse RestaurantDetailMenuFoodModel from json', () {
          var parsedResult = RestaurantDetailMenuFoodModel.fromJson(foodJson);
          expect(parsedResult.name, 'Toastie salmon');
        });

        test('Should parse RestaurantDetailMenuFoodModel to json', () {
          var parsedResult =
              RestaurantDetailMenuFoodModel.fromJson(foodJson).toMap();
          expect(parsedResult, foodJson);
          expect(parsedResult['name'], 'Toastie salmon');
        });
      });
      group('Parse RestaurantDetailMenuModel', () {
        var menuJson = {
          "foods": [
            {"name": "Paket rosemary"},
            {"name": "Toastie salmon"},
          ],
          "drinks": [
            {"name": "Es krim"},
            {"name": "Sirup"},
          ],
        };
        test('Should parse RestaurantDetailMenuModel from json', () {
          var parsedResult = RestaurantDetailMenuModel.fromJson(menuJson);
          expect(parsedResult.foods.length, 2);
          expect(parsedResult.drinks.length, 2);
        });

        test('Should parse RestaurantDetailMenuModel to json', () {
          var parsedResult =
              RestaurantDetailMenuModel.fromJson(menuJson).toMap();
          expect(parsedResult, menuJson);
          expect(parsedResult['foods']?.length, 2);
          expect(parsedResult['drinks']?.length, 2);
        });
      });
      group('Parse RestaurantDetailCategoryModel', () {
        var categoryJson = {"name": "Italia"};
        test('Should parse RestaurantDetailCategoryModel from json', () {
          var parsedResult = RestaurantDetailCategoryModel.fromJson(
            categoryJson,
          );
          expect(parsedResult.name, 'Italia');
        });

        test('Should parse RestaurantDetailCategoryModel to json', () {
          var parsedResult =
              RestaurantDetailCategoryModel.fromJson(categoryJson).toMap();
          expect(parsedResult, categoryJson);
          expect(parsedResult['name'], 'Italia');
        });
      });
      group('Parse RestaurantDetailModel', () {
        var detailJson = {
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
        };
        test('Should parse RestaurantDetailModel from json', () {
          var parsedResult = RestaurantDetailModel.fromJson(detailJson);
          expect(parsedResult.id, 'rqdv5juczeskfw1e867');
          expect(parsedResult.name, 'Melting Pot');
          expect(
            parsedResult.description,
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...',
          );
          expect(parsedResult.pictureId, '14');
          expect(parsedResult.city, 'Medan');
          expect(parsedResult.rating, 4.2);
          expect(parsedResult.address, 'Jln. Pandeglang no 19');
          expect(parsedResult.categories.length, 2);
          expect(parsedResult.menus.drinks.length, 2);
          expect(parsedResult.menus.foods.length, 2);
          expect(parsedResult.customerReviews.length, 1);
        });

        test('Should parse RestaurantDetailModel to json', () {
          var parsedResult = RestaurantDetailModel.fromJson(detailJson).toMap();
          expect(parsedResult, detailJson);
          expect(parsedResult['id'], 'rqdv5juczeskfw1e867');
          expect(parsedResult['name'], 'Melting Pot');
          expect(
            parsedResult['description'],
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. ...',
          );
          expect(parsedResult['pictureId'], '14');
          expect(parsedResult['city'], 'Medan');
          expect(parsedResult['rating'], 4.2);
          expect(parsedResult['address'], 'Jln. Pandeglang no 19');
          expect(parsedResult['categories']?.length, 2);
          expect(parsedResult['menus']?['drinks']?.length, 2);
          expect(parsedResult['menus']?['foods']?.length, 2);
          expect(parsedResult['customerReviews']?.length, 1);
        });
      });
      group('Parse GetRestauranDetailModel', () {
        var detailResponseJson = {
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
        test('Should parse GetRestauranDetailModel from json', () {
          var parsedResult = GetRestauranDetailModel.fromJson(
            detailResponseJson,
          );
          expect(parsedResult.error, false);
          expect(parsedResult.message, 'success');
        });

        test('Should parse GetRestauranDetailModel to json', () {
          var parsedResult =
              GetRestauranDetailModel.fromJson(detailResponseJson).toMap();
          expect(parsedResult, detailResponseJson);
          expect(parsedResult['error'], false);
          expect(parsedResult['message'], 'success');
        });
      });
    });
    group('Parse SearchRestaurantModel', () {
      group('Parse search with RestaurantModel', () {
        var searchItemJson = {
          "id": "fnfn8mytkpmkfw1e867",
          "name": "Makan mudah",
          "description":
              "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...",
          "pictureId": "22",
          "city": "Medan",
          "rating": 3.7,
        };

        test('Should parse search with RestaurantModel from json', () {
          var parsedResult = RestaurantModel.fromJson(searchItemJson);
          expect(parsedResult.id, 'fnfn8mytkpmkfw1e867');
          expect(parsedResult.name, 'Makan mudah');
          expect(
            parsedResult.description,
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...',
          );
          expect(parsedResult.pictureId, '22');
          expect(parsedResult.city, 'Medan');
          expect(parsedResult.rating, 3.7);
        });

        test('Should parse search with RestaurantModel to json', () {
          var parsedResult = RestaurantModel.fromJson(searchItemJson).toMap();
          expect(parsedResult, searchItemJson);
          expect(parsedResult['id'], 'fnfn8mytkpmkfw1e867');
          expect(parsedResult['name'], 'Makan mudah');
          expect(
            parsedResult['description'],
            'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, ...',
          );
          expect(parsedResult['pictureId'], '22');
          expect(parsedResult['city'], 'Medan');
          expect(parsedResult['rating'], 3.7);
        });
      });

      group('Parse SearchRestaurantModel', () {
        var searchResponseJson = {
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
        test('Should parse SearchRestaurantModel from json', () {
          var parsedResult = SearchRestaurantModel.fromJson(searchResponseJson);
          expect(parsedResult.error, false);
          expect(parsedResult.founded, 1);
          expect(parsedResult.restaurants.length, 1);
        });
        test('Should parse SearchRestaurantModel to json', () {
          var parsedResult =
              SearchRestaurantModel.fromJson(searchResponseJson).toMap();
          expect(parsedResult, searchResponseJson);
          expect(parsedResult['error'], false);
          expect(parsedResult['founded'], 1);
          expect(parsedResult['restaurants']?.length, 1);
        });
      });
    });
  });
}
