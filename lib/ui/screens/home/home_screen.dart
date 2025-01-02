import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app_1/utils/theme.dart';

import '../../widgets/home/build_content_home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoPageScaffold(
            child: BuildContentHomeWidget(),
          )
        : Scaffold(
            body: BuildContentHomeWidget(),
          );
  }
}
