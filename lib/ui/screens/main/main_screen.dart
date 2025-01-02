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
    final int currentIndex = navigationProvider.currentIndex;
    final List<Widget> pages = [
      HomeScreen(),
      SearchScreen(),
      FavoritesScreen(),
    ];

    final mediaQueryH = MediaQuery.of(context).size.height;
    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              height: mediaQueryH * 0.1,
              currentIndex: currentIndex,
              onTap: navigationProvider.setIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(currentIndex == 0
                      ? CupertinoIcons.house_fill
                      : CupertinoIcons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(currentIndex == 1
                      ? CupertinoIcons.search_circle
                      : CupertinoIcons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(currentIndex == 2
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart),
                  label: 'Favorites',
                ),
              ],
            ),
            tabBuilder: (context, index) => CupertinoTabView(
              builder: (context) => pages[index],
            ),
          )
        : Scaffold(
            body: pages[currentIndex],
            bottomNavigationBar: SizedBox(
              height: mediaQueryH * 0.1,
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: navigationProvider.setIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                        currentIndex == 0 ? Icons.home : Icons.home_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(currentIndex == 1
                        ? Icons.search_sharp
                        : Icons.search_outlined),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(currentIndex == 2
                        ? Icons.favorite
                        : Icons.favorite_border),
                    label: 'Favorites',
                  ),
                ],
              ),
            ),
          );
  }
}
