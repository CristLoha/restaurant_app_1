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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Restaurant',
              style: AppTextStyles.textTheme.headlineMedium,
            ),
            Text(
              'Recommendation restaurant for you!',
              style: AppTextStyles.textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            Consumer<RestaurantListProvider>(builder: (context, value, child) {
              return switch (value.resultState) {
                RestaurantListLoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                RestaurantListLoadedState(data: var restaurantList) =>
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurantList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final restaurant = restaurantList[index];
                        return RestaurantCardWidget(
                          onTap: () {},
                          restaurant: restaurant,
                        );
                      }),
                RestaurantListErrorState(message: var message) => Center(
                    child: Text(message),
                  ),
                _ => const SizedBox()
              };
            }),
          ],
        ),
      ),
    );
  }
}
