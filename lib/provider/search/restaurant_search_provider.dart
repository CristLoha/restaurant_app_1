import 'package:flutter/material.dart';
import 'package:restaurant_app_1/data/api/api_service.dart';
import 'package:restaurant_app_1/static/restaurant_search_result_state.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService _apiService;
  RestaurantSearchProvider(this._apiService);

  RestaurantSearchResultState _resultState = RestaurantSearchNoneState();
  RestaurantSearchResultState get resultState => _resultState;

  Future<void> searchRestaurant(String query) async {
    try {
      _resultState = RestaurantSearchLoadingState();
      notifyListeners();
      print('State: Loading');

      final result = await _apiService.searchRestaurant(query);
      if (result.restaurants.isEmpty) {
        _resultState = RestaurantSearchErrorState('Restoran tidak ditemukan.');
        notifyListeners();
        print('State: Error - Restoran tidak ditemukan');
      } else {
        _resultState = RestaurantSearchLoadedState(result.restaurants);
        notifyListeners();
        print(
            'State: Loaded - ${result.restaurants.length} restoran ditemukan');
      }
    } catch (e) {
      _resultState = RestaurantSearchErrorState(
          e is String ? e : 'Terjadi kesalahan. Coba lagi nanti.');
      notifyListeners();
      print('State: Error - $e');
    }
  }
}
