import 'package:flutter/material.dart';
import '../../data/models/restaurant_detail_model.dart';

class RestaurantInfoWidget extends StatefulWidget {
  final RestaurantDetailModel restaurant;

  const RestaurantInfoWidget({super.key, required this.restaurant});

  @override
  State<RestaurantInfoWidget> createState() => _RestaurantInfoWidgetState();
}

class _RestaurantInfoWidgetState extends State<RestaurantInfoWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final description = widget.restaurant.description;
    final maxLines = _isExpanded ? null : 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            widget.restaurant.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            description,
            maxLines: maxLines,
            overflow:
                _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
        ),
        if (description.length > 100)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? 'Read Less' : 'Read More'),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Location',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '${widget.restaurant.city}, ${widget.restaurant.address}',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
