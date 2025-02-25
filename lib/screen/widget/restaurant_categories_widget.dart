import 'package:flutter/material.dart';
import '../../data/models/restaurant_detail_category_model.dart';

class RestaurantCategoriesWidget extends StatelessWidget {
  final List<RestaurantDetailCategoryModel> categories;

  const RestaurantCategoriesWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Wrap(
              spacing: 8.0,
              children:
                  categories
                      .map((category) => Chip(label: Text(category.name)))
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
