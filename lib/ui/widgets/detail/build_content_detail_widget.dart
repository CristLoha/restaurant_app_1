import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
              Icon(
                  defaultTargetPlatform == TargetPlatform.iOS
                      ? CupertinoIcons.map_pin_ellipse
                      : Icons.location_on,
                  size: 16,
                  color: AppColors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
