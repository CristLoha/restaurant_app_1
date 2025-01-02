import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/provider/navigation_provider.dart';
import 'package:restaurant_app_1/ui/screens/favorites/favorites_screen.dart';
import 'package:restaurant_app_1/ui/screens/home/home_screen.dart';
import 'package:restaurant_app_1/ui/screens/search/search_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final List<Widget> pages = [
      HomeScreen(),
      SearchScreen(),
      FavoritesScreen(),
    ];

    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              currentIndex: navigationProvider.currentIndex,
              onTap: navigationProvider.setIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart),
                  label: 'Favorites',
                ),
              ],
            ),
            tabBuilder: (context, index) => CupertinoTabView(
              builder: (context) => pages[index],
            ),
          )
        : Scaffold(
            body: pages[navigationProvider.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navigationProvider.currentIndex,
              onTap: navigationProvider.setIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
              ],
            ),
          );
  }
}
