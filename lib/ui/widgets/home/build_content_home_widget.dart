import 'package:flutter/material.dart';
import 'package:restaurant_app_1/utils/theme.dart';

class BuildContentHomeWidget extends StatelessWidget {
  const BuildContentHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> restaurants = [
      {
        'name': 'Restaurant A',
        'location': 'Jakarta',
        'rating': 4.5,
        'image': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Restaurant B',
        'location': 'Bandung',
        'rating': 4.2,
        'image': 'https://via.placeholder.com/150',
      },
      {
        'name': 'Restaurant C',
        'location': 'Surabaya',
        'rating': 4.8,
        'image': 'https://via.placeholder.com/150',
      },
    ];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            restaurant['image'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Column(
                          spacing: 4,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              restaurant['name'],
                              style: AppTextStyles.textTheme.headlineSmall,
                            ),
                            Row(
                              spacing: 4,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.grey,
                                  size: 16,
                                ),
                                Text(
                                  restaurant['location'],
                                  style: AppTextStyles.textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Row(
                              spacing: 4,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 16,
                                ),
                                Text(
                                  restaurant['rating'].toString(),
                                  style: AppTextStyles.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
