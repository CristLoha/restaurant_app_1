import 'restaurant.dart';

class RestaurantResponse {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) {
    return RestaurantResponse(
      error: json['error'],
      message: json['message'],
      count: json['count'],
      restaurants: List<Restaurant>.from(
        json['restaurants'].map((x) => Restaurant.fromJson(x)),
      ),
    );
  }
}
