import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/data/models/restaurant_detail_customer_review_model.dart';
import 'package:restaurant/data/models/restaurant_detail_menu_drink_model.dart';
import 'package:restaurant/data/models/restaurant_detail_menu_food_model.dart';
import 'package:restaurant/data/provider/favorite_restaurant_provider.dart';
import 'package:restaurant/data/provider/restaurant_detail_provider.dart';
import '../../data/models/restaurant_detail_model.dart';
import '../../data/models/restaurant_model.dart';
import 'hero_image_widget.dart';
import 'restaurant_info_widget.dart';
import 'restaurant_categories_widget.dart';
import 'restaurant_rating_widget.dart';

class DetailContentWidget extends StatefulWidget {
  final RestaurantDetailModel restaurant;

  const DetailContentWidget({super.key, required this.restaurant});

  @override
  State<DetailContentWidget> createState() => _DetailContentWidgetState();
}

class _DetailContentWidgetState extends State<DetailContentWidget> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteRestaurantProvider>(context);
    final isFavorite = favoriteProvider.isFavorite(widget.restaurant.id);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              HeroImageWidget(pictureId: widget.restaurant.pictureId),
              Positioned(
                top: 16,
                right: 16,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        final restaurant = RestaurantModel(
                          id: widget.restaurant.id,
                          name: widget.restaurant.name,
                          description: widget.restaurant.description,
                          pictureId: widget.restaurant.pictureId,
                          city: widget.restaurant.city,
                          rating: widget.restaurant.rating,
                        );
                        if (isFavorite) {
                          favoriteProvider.removeFavorite(restaurant.id);
                        } else {
                          favoriteProvider.addFavorite(restaurant);
                        }
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          RestaurantInfoWidget(restaurant: widget.restaurant),
          RestaurantCategoriesWidget(categories: widget.restaurant.categories),
          RestaurantRatingWidget(rating: widget.restaurant.rating),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Menu Makanan',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildMenuList(widget.restaurant.menus.foods, context),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Menu Minuman',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildDrinkList(widget.restaurant.menus.drinks, context),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Customer Reviews',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Consumer<RestaurantDetailProvider>(
            builder: (context, provider, child) {
              return _buildReviewList(
                provider.restaurantDetail!.customerReviews,
                context,
              );
            },
          ),
          _buildAddReviewForm(context),
        ],
      ),
    );
  }

  Widget _buildMenuList(
    List<RestaurantDetailMenuFoodModel> foods,
    BuildContext context,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.fastfood),
          title: Text(
            foods[index].name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      },
    );
  }

  Widget _buildDrinkList(
    List<RestaurantDetailMenuDrinkModel> drinks,
    BuildContext context,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.local_drink),
          title: Text(
            drinks[index].name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      },
    );
  }

  Widget _buildReviewList(
    List<RestaurantDetailCustomerReviewModel> reviews,
    BuildContext context,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(
            reviews[index].name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          subtitle: Text(
            reviews[index].review,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      },
    );
  }

  Widget _buildAddReviewForm(BuildContext context) {
    final nameController = TextEditingController();
    final reviewController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Your Review',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Your Name'),
              ),
              TextField(
                controller: reviewController,
                decoration: const InputDecoration(labelText: 'Your Review'),
              ),
              const SizedBox(height: 8.0),
              _buildSubmitButton(context, nameController, reviewController),
              _buildReviewMessage(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    TextEditingController nameController,
    TextEditingController reviewController,
  ) {
    return Consumer<RestaurantDetailProvider>(
      builder: (context, provider, child) {
        return ElevatedButton(
          onPressed:
              provider.reviewState == ReviewState.loading
                  ? null
                  : () {
                    final name = nameController.text;
                    final review = reviewController.text;
                    if (name.isNotEmpty && review.isNotEmpty) {
                      provider.addReview(widget.restaurant.id, name, review);
                      nameController.clear();
                      reviewController.clear();
                    }
                  },
          child:
              provider.reviewState == ReviewState.loading
                  ? CircularProgressIndicator()
                  : const Text('Submit'),
        );
      },
    );
  }

  Widget _buildReviewMessage(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(
      builder: (context, provider, child) {
        if (provider.reviewState == ReviewState.error) {
          return Text(
            provider.reviewMessage,
            style: TextStyle(color: Colors.red),
          );
        } else if (provider.reviewState == ReviewState.success) {
          return Text(
            'Review added successfully!',
            style: TextStyle(color: Colors.green),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
