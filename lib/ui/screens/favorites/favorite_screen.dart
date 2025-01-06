import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/provider/detail/favorite_list_provider.dart';
import 'package:restaurant_app_1/static/navigation_route.dart';
import 'package:restaurant_app_1/ui/screens/home/widget/restaurant_card_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite List'),
      ),
      body: Consumer<FavoriteListProvider>(
        builder: (context, value, child) {
          final favoriteList = value.favoriteList;
          return switch (favoriteList.isNotEmpty) {
            true => ListView.builder(
                itemCount: favoriteList.length,
                itemBuilder: (context, index) {
                  final restaurant = favoriteList[index];
                  return RestaurantCardWidget(
                      restaurant: restaurant,
                      onTap: () {
                        Navigator.pushNamed(
                            context, NavigationRoute.detailRoute.name,
                            arguments: restaurant.id);
                      });
                }),
            _ => Center(
                child: Column(
                  children: [
                    Text('No Favorites'),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}