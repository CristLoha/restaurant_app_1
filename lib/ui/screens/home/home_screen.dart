import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app_1/static/restaurant_result_state.dart';

import '../../../utils/theme.dart';
import 'restaurant_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<RestaurantListProvider>().fetchRestaurantList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant',
              style: AppTextStyles.textTheme.headlineMedium,
            ),
            Text(
              'Recommendation restaurant for you!',
              style: AppTextStyles.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
      body: Consumer<RestaurantListProvider>(builder: (context, value, child) {
        return switch (value.resultState) {
          RestaurantLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
          RestaurantListLoadedState(data: var restaurantList) =>
            ListView.builder(
                itemCount: restaurantList.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurantList[index];
                  return RestaurantCardWidget(
                    onTap: () {},
                    restaurant: restaurant,
                  );
                }),
          RestaurantErrorState(message: var message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Oops!',
                    style: AppTextStyles.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<RestaurantListProvider>()
                          .fetchRestaurantList();
                    },
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            ),
          _ => const SizedBox()
        };
      }),
    );
  }
}
