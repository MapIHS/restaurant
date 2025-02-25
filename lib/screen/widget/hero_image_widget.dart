import 'package:flutter/material.dart';

class HeroImageWidget extends StatelessWidget {
  final String pictureId;

  const HeroImageWidget({super.key, required this.pictureId});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: pictureId,
      child: Image.network(
        'https://restaurant-api.dicoding.dev/images/large/$pictureId',
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
