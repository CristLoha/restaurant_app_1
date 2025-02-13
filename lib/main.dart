import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/data/api/api_service.dart';
import 'package:restaurant_app_1/data/local/local_database_service.dart';
import 'package:restaurant_app_1/provider/favorite/local_database_provider.dart';
import 'package:restaurant_app_1/provider/navigation/navigation_provider.dart';
import 'package:restaurant_app_1/provider/search/restaurant_search_provider.dart';
import 'package:restaurant_app_1/static/navigation_route.dart';
import 'package:restaurant_app_1/ui/screens/detail/detail_screen.dart';
import 'package:restaurant_app_1/utils/theme.dart';
import 'provider/detail/restaurant_detail_provider.dart';
import 'provider/home/restaurant_list_provider.dart';
import 'provider/theme/theme_provider.dart';
import 'ui/screens/navigation/navigation_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
        Provider(create: (context) => ApiService()),
        ChangeNotifierProvider(
          create: (context) => RestaurantListProvider(
            context.read<ApiService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantDetailProvider(
            context.read<ApiService>(),
          ),
        ),
        Provider(
          create: (context) => LocalDatabaseService(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalDatabaseProvider(
            context.read<LocalDatabaseService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => RestaurantSearchProvider(
            context.read<ApiService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider()..loadTheme(),
        ),
      ],
      child: RestaurantApp(),
    ),
  );
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, _) {
      return MaterialApp(
        title: 'Restaurant App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeProvider.themeMode,
        initialRoute: NavigationRoute.mainRoute.name,
        routes: {
          NavigationRoute.mainRoute.name: (context) => const NavigationScreen(),
          NavigationRoute.detailRoute.name: (context) => DetailScreen(
                tourismId: ModalRoute.of(context)?.settings.arguments as String,
              )
        },
      );
    });
  }
}
