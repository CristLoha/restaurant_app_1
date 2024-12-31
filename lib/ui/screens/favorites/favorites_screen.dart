import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Favorites'),
            ),
            child: Column(
              children: [],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Favorites'),
            ),
          );
  }
}
