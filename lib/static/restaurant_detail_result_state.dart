import '../data/model/restaurant_detail.dart';

sealed class RestaurantDetailResultState {}

class RestaurantDetailNoneState extends RestaurantDetailResultState {}

class RestaurantDetailLoadingState extends RestaurantDetailResultState {}

class RestaurantDetailErrorState extends RestaurantDetailResultState {
  final String message;

  RestaurantDetailErrorState(this.message);
}

class RestaurantDetailLoadedState extends RestaurantDetailResultState {
  final RestaurantDetail data;

  RestaurantDetailLoadedState(this.data);
}
