import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/provider/scheduling/scheduling_provider.dart';

class BuildDailyReminderSectionWidget extends StatelessWidget {
  const BuildDailyReminderSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SchedulingProvider>(builder: (context, provider, _) {
      return ListTile(
        title: Text('Restaurant Reminder'),
        trailing: Switch.adaptive(
            value: provider.isDailyRestaurantActive,
            onChanged: (value) {
              provider.enableDailyRestaurants(value);
            }),
      );
    });
  }
}
