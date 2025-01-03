import 'package:flutter/material.dart';
import 'package:restaurant_app_1/data/api/api_service.dart';
import 'package:restaurant_app_1/static/restaurant_result_state.dart';

class RestaurantListProvider extends ChangeNotifier {
  final ApiService _apiService;

  RestaurantListProvider(this._apiService);

  RestaurantResultState _resultState = RestaurantNoneState();

  RestaurantResultState get resultState => _resultState;

  Future<void> fetchRestaurantList() async {
    try {
      _resultState = RestaurantLoadingState();
      notifyListeners();
      final result = await _apiService.getRestaruantList();

      if (result.error) {
        _resultState = RestaurantErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = RestaurantListLoadedState(result.restaurants);
        notifyListeners();
      }
    } catch (e) {
      _resultState = RestaurantErrorState(
          e is String ? e : 'Terjadi kesalahan. Coba lagi nanti.');
      notifyListeners();
    }
  }
}
