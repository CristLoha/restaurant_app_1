import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app_1/ui/widgets/detail/build_content_detail_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return defaultTargetPlatform == TargetPlatform.iOS
        ? CupertinoPageScaffold(child: BuildContentDetailWidget())
        : Scaffold(body: BuildContentDetailWidget());
  }
}
