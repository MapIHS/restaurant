import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/routes/app_route.dart';

import '../../data/models/restaurant_model.dart';
import '../../data/provider/restaurant_provider.dart';
import 'restaurant_widget.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, provider, child) {
        if (provider.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (provider.state == ResultState.hasData) {
          return ListView.builder(
            itemCount: provider.restaurants.length,
            itemBuilder: (context, index) {
              final RestaurantModel restaurant = provider.restaurants[index];
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.detailScreen,
                    arguments: restaurant.id.toString(),
                  );
                },
                child: RestaurantWidget(
                  image: restaurant.pictureId,
                  title: restaurant.name,
                  city: restaurant.city,
                  rating: restaurant.rating,
                ),
              );
            },
          );
        } else if (provider.state == ResultState.noData) {
          return Center(child: Text(provider.message));
        } else if (provider.state == ResultState.error) {
          return Center(child: Text(provider.message));
        } else {
          return const Center(child: Text('No Message'));
        }
      },
    );
  }
}
