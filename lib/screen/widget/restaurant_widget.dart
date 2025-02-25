import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RestaurantWidget extends StatelessWidget {
  final String image;
  final String title;
  final String city;
  final double rating;
  const RestaurantWidget({
    super.key,
    required this.image,
    required this.title,
    required this.city,
    required this.rating,
  });

  final _baseUrl = 'https://restaurant-api.dicoding.dev/images/small';

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Hero(
              tag: image,
              child: CachedNetworkImage(
                imageUrl: '$_baseUrl/$image',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey, size: 16),
                      Text(city, style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        rating.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      ...List.generate(rating.toInt(), (starIndex) {
                        return Icon(
                          starIndex < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 20,
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
