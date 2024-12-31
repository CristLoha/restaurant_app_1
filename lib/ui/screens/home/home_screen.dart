import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Home'),
            ),
            child: Column(
              children: [],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text('Home'),
            ),
          );
  }
}
