import 'package:flutter/material.dart';
import 'package:restaurant_app_1/services/restaurant_notification_service.dart';

class RestaurantNotificationProvider extends ChangeNotifier {
  final RestaurantNotificationService notificationService;

  RestaurantNotificationProvider(this.notificationService);

  bool? _permission = false;

  bool? get permission => _permission;

  Future<void> requestPermission() async {
    _permission = await notificationService.requestPermissions();
    notifyListeners();
  }

  Future<void> scheduleDailyNotification(int hour, int minute) async {
    await notificationService.scheduleDailyNotification(hour, minute);
    notifyListeners();
  }

  Future<void> showNotification({
    required String title,
    required String body,
    required String payload,
    required int hour,
    required int minute,
  }) async {
    await notificationService.showNotification(
      title: title,
      body: body,
      payload: payload,
      hour: hour,
      minute: minute,
    );
    notifyListeners();
  }
}
