import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/data/provider/search_restaurant_provider.dart';
import 'package:restaurant/routes/app_route.dart';

import 'restaurant_widget.dart';

class SearchContentWidget extends StatelessWidget {
  const SearchContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_buildSearch(context), _buildList()]);
  }

  Expanded _buildList() {
    return Expanded(
      child: Consumer<SearchRestaurantProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: provider.restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = provider.restaurants[index];
                return InkWell(
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
          } else if (provider.state == ResultState.noData) {
            return Center(
              child: Text(
                provider.message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else if (provider.state == ResultState.error) {
            return Center(
              child: Text(
                provider.message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else {
            return const Center(
              child: Text('No Message', style: TextStyle(color: Colors.grey)),
            );
          }
        },
      ),
    );
  }

  Padding _buildSearch(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          border: const OutlineInputBorder(),
          suffixIcon: const Icon(Icons.search),
        ),
        onChanged: (query) {
          Provider.of<SearchRestaurantProvider>(
            context,
            listen: false,
          ).searchRestaurant(query);
        },
      ),
    );
  }
}
