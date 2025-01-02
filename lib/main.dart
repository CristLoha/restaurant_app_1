import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/provider/navigation_provider.dart';
import 'package:restaurant_app_1/utils/theme.dart';

import 'ui/screens/main/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        )
      ],
      child: RestaurantApp(),
    ),
  );
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoApp(
            title: 'Restaurant App',
            theme: const CupertinoThemeData(
              primaryColor: AppColors.primary,
              barBackgroundColor: AppColors.surface,
              scaffoldBackgroundColor: AppColors.background,
            ),
            debugShowCheckedModeBanner: false,
            home: const MainScreen(),
          )
        : MaterialApp(
            title: 'Restaurant App',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: const MainScreen(),
          );
  }
}
