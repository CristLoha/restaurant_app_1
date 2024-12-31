import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Search'),
            ),
            child: Column(
              children: [],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Search'),
            ),
          );
  }
}
