import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/provider/search/restaurant_search_provider.dart';
import 'package:restaurant_app_1/static/navigation_route.dart';
import 'package:restaurant_app_1/static/restaurant_list_result_state.dart';
import 'package:restaurant_app_1/ui/screens/home/widget/restaurant_card_widget.dart';
import 'package:restaurant_app_1/ui/widgets/error_card_widget.dart';
import 'package:restaurant_app_1/utils/theme.dart';

import '../../../static/restaurant_search_result_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Restaurant'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Cari restorant',
                border: OutlineInputBorder(),
                fillColor: AppColors.grey,
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  context
                      .read<RestaurantSearchProvider>()
                      .searchRestaurant(query);
                }
              },
            ),
          ),
          Expanded(
            child: Consumer<RestaurantSearchProvider>(
                builder: (context, value, child) {
              return switch (value.resultState) {
                RestaurantSearchLoadingState() => Center(
                    child: CircularProgressIndicator(),
                  ),
                RestaurantSearchLoadedState(data: var restaurants) =>
                  ListView.builder(
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = restaurants[index];
                      return RestaurantCardWidget(
                        restaurant: restaurant,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            NavigationRoute.detailRoute.name,
                            arguments: restaurant.id,
                          );
                        },
                      );
                    },
                  ),
                RestaurantSearchErrorState() => Center(
                    child: ErrorCardWidget(
                      message: "Kata tidak ditemukan",
                      onTap: () {
                        final query = _controller.text;
                        if (query.isNotEmpty) {
                          context
                              .read<RestaurantSearchProvider>()
                              .searchRestaurant(query);
                        }
                      },
                    ),
                  ),
                _ => const Center(
                    child: Text('Masukkan kata kunci untuk mencari restorant'),
                  )
              };
            }),
          ),
        ],
      ),
    );
  }
}
