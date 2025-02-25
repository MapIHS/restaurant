import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/provider/restaurant_detail_provider.dart';
import 'widget/detail_content_widget.dart';

class DetailScreen extends StatelessWidget {
  final String restaurantId;

  const DetailScreen({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => RestaurantDetailProvider(
            apiService: ApiService(client: http.Client()),
          )..fetchRestaurantDetail(restaurantId),
      child: Scaffold(
        appBar: AppBar(title: const Text('Detail Restaurant')),
        body: Consumer<RestaurantDetailProvider>(
          builder: (context, state, _) {
            if (state.state == ResultState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.state == ResultState.hasData) {
              return DetailContentWidget(restaurant: state.restaurantDetail!);
            } else if (state.state == ResultState.noData) {
              return Center(child: Text(state.message));
            } else if (state.state == ResultState.error) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No Message'));
            }
          },
        ),
      ),
    );
  }
}
