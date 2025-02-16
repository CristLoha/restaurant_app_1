import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/data/api/api_service.dart';
import 'package:restaurant_app_1/data/local/local_database_service.dart';
import 'package:restaurant_app_1/provider/favorite/local_database_provider.dart';
import 'package:restaurant_app_1/provider/navigation/navigation_provider.dart';
import 'package:restaurant_app_1/provider/search/restaurant_search_provider.dart';
import 'package:restaurant_app_1/services/restaurant_notification_service.dart';
import 'package:restaurant_app_1/static/navigation_route.dart';
import 'package:restaurant_app_1/ui/screens/detail/detail_screen.dart';
import 'package:restaurant_app_1/utils/theme.dart';
import 'provider/detail/restaurant_detail_provider.dart';
import 'provider/home/restaurant_list_provider.dart';
import 'provider/scheduling/restaurant_notfication_provider.dart';
import 'provider/scheduling/scheduling_provider.dart';
import 'provider/theme/theme_provider.dart';
import 'ui/screens/navigation/navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi layanan terlebih dahulu
  final notificationService = RestaurantNotificationService();
  await notificationService.init();
  await notificationService.configureLocalTimeZone();

  final localDatabaseService = LocalDatabaseService();

  runApp(
    MultiProvider(
      providers: [
        // Provider untuk layanan (tanpa dependencies)
        Provider<ApiService>(create: (_) => ApiService()),
        Provider<LocalDatabaseService>(create: (_) => localDatabaseService),
        Provider<RestaurantNotificationService>(
            create: (_) => notificationService),

        // Provider yang bergantung pada layanan di atas
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
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
        ChangeNotifierProvider(
          create: (context) => RestaurantNotificationProvider(
            context.read<RestaurantNotificationService>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SchedulingProvider(
            notificationService:
                notificationService, // Langsung gunakan instance yang sudah diinisialisasi
          ),
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
