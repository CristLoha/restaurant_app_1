import 'package:flutter/material.dart';
import 'package:restaurant_app_1/ui/screens/settings/widgets/build_reminder_section_widget.dart';
import 'package:restaurant_app_1/ui/screens/settings/widgets/build_theme_section_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          BuildThemeSectionWidget(),
          BuildDailyReminderSectionWidget(),
        ],
      ),
    );
  }
}
