import 'package:flutter/material.dart';
import 'package:restaurant_app_1/services/restaurant_notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchedulingProvider extends ChangeNotifier {
  bool _isDailyRestaurantActive = false;
  bool get isDailyRestaurantActive => _isDailyRestaurantActive;

  final RestaurantNotificationService _notificationService;

  SchedulingProvider(
      {required RestaurantNotificationService notificationService})
      : _notificationService = notificationService {
    _loadDailyRestaurantStatus();
  }

  Future<void> _loadDailyRestaurantStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isDailyRestaurantActive =
        prefs.getBool('isDailyRestaurantActive') ?? false;
    notifyListeners();
  }

  Future<void> enableDailyRestaurants(bool value) async {
    _isDailyRestaurantActive = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDailyRestaurantActive', value);
    notifyListeners();

    if (value) {
      await _notificationService.scheduleDailyNotification(11, 0);
    } else {
      await _notificationService.cancelAllNotifications();
    }
  }
}
