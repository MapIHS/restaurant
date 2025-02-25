import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/data/provider/favorite_restaurant_provider.dart';
import 'package:restaurant/routes/app_route.dart';
import 'restaurant_widget.dart';
import '../../data/models/restaurant_model.dart';

class FavoriteListWidget extends StatelessWidget {
  const FavoriteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteRestaurantProvider>(
      builder: (context, favoriteProvider, child) {
        if (favoriteProvider.favorites.isEmpty) {
          return Center(child: Text('No favorites found'));
        } else {
          return ListView.builder(
            itemCount: favoriteProvider.favorites.length,
            itemBuilder: (context, index) {
              final RestaurantModel restaurant =
                  favoriteProvider.favorites[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoute.detailScreen,
                    arguments: restaurant.id,
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
        }
      },
    );
  }
}
