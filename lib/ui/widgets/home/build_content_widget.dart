import 'package:flutter/material.dart';

class BuildContentWidget extends StatelessWidget {
  const BuildContentWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Restaurant',
              style: textTheme.headlineMedium,
            ),
            Text(
              'Recommendation restaurant for you!',
              style: textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
