import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:restaurant/data/api/api_service.dart';
import 'package:restaurant/data/provider/search_restaurant_provider.dart';
import 'package:restaurant/screen/widget/search_content_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) => SearchRestaurantProvider(
            apiService: ApiService(client: http.Client()),
          ),
      child: Scaffold(
        appBar: AppBar(title: const Text('Search Restaurant')),
        body: SearchContentWidget(),
      ),
    );
  }
}
