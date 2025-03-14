// Mocks generated by Mockito 5.4.5 from annotations
// in restaurant/test/restaurant_detail_provider/restaurant_detail_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i8;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:restaurant/data/api/api_service.dart' as _i7;
import 'package:restaurant/data/models/add_review_response_model.dart' as _i6;
import 'package:restaurant/data/models/get_restauran_detail_model.dart' as _i5;
import 'package:restaurant/data/models/get_restaurant_list_model.dart' as _i3;
import 'package:restaurant/data/models/search_restaurant_model.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGetRestaurantListModel_1 extends _i1.SmartFake
    implements _i3.GetRestaurantListModel {
  _FakeGetRestaurantListModel_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeSearchRestaurantModel_2 extends _i1.SmartFake
    implements _i4.SearchRestaurantModel {
  _FakeSearchRestaurantModel_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeGetRestauranDetailModel_3 extends _i1.SmartFake
    implements _i5.GetRestauranDetailModel {
  _FakeGetRestauranDetailModel_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeAddReviewResponseModel_4 extends _i1.SmartFake
    implements _i6.AddReviewResponseModel {
  _FakeAddReviewResponseModel_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [ApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiService extends _i1.Mock implements _i7.ApiService {
  MockApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client =>
      (super.noSuchMethod(
            Invocation.getter(#client),
            returnValue: _FakeClient_0(this, Invocation.getter(#client)),
          )
          as _i2.Client);

  @override
  _i8.Future<_i3.GetRestaurantListModel> getListRestaurant() =>
      (super.noSuchMethod(
            Invocation.method(#getListRestaurant, []),
            returnValue: _i8.Future<_i3.GetRestaurantListModel>.value(
              _FakeGetRestaurantListModel_1(
                this,
                Invocation.method(#getListRestaurant, []),
              ),
            ),
          )
          as _i8.Future<_i3.GetRestaurantListModel>);

  @override
  _i8.Future<_i4.SearchRestaurantModel> searchRestaurant(String? keyw) =>
      (super.noSuchMethod(
            Invocation.method(#searchRestaurant, [keyw]),
            returnValue: _i8.Future<_i4.SearchRestaurantModel>.value(
              _FakeSearchRestaurantModel_2(
                this,
                Invocation.method(#searchRestaurant, [keyw]),
              ),
            ),
          )
          as _i8.Future<_i4.SearchRestaurantModel>);

  @override
  _i8.Future<_i5.GetRestauranDetailModel> getDetailRestaurant(dynamic id) =>
      (super.noSuchMethod(
            Invocation.method(#getDetailRestaurant, [id]),
            returnValue: _i8.Future<_i5.GetRestauranDetailModel>.value(
              _FakeGetRestauranDetailModel_3(
                this,
                Invocation.method(#getDetailRestaurant, [id]),
              ),
            ),
          )
          as _i8.Future<_i5.GetRestauranDetailModel>);

  @override
  _i8.Future<_i6.AddReviewResponseModel> addReview(
    String? restaurantId,
    String? name,
    String? review,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#addReview, [restaurantId, name, review]),
            returnValue: _i8.Future<_i6.AddReviewResponseModel>.value(
              _FakeAddReviewResponseModel_4(
                this,
                Invocation.method(#addReview, [restaurantId, name, review]),
              ),
            ),
          )
          as _i8.Future<_i6.AddReviewResponseModel>);
}
