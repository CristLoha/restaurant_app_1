import 'package:flutter/material.dart';
import 'package:restaurant_app_1/utils/theme.dart';

class BuildContentDetailWidget extends StatelessWidget {
  const BuildContentDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network(
          'https://restaurant-api.dicoding.dev/images/medium/14',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Melting Pot",
            style: AppTextStyles.textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.location_on, size: 16, color: AppColors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
