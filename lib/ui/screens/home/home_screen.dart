import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app_1/utils/theme.dart';

import '../../widgets/home/build_content_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = AppTextStyles.textTheme;
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

    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoPageScaffold(
            child: BuildContentWidget(textTheme: textTheme),
          )
        : Scaffold(
            body: BuildContentWidget(textTheme: textTheme),
          );
  }
}
