import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:restaurant_app_1/data/model/restaurant_list_response.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev';
  static const String _listEndpoint = '/list';
  static const Duration _timeoutDuration = Duration(seconds: 10);

  Future<RestaurantListResponse> getRestaruantList() async {
    try {
      final response = await http
          .get(Uri.parse("$_baseUrl$_listEndpoint"))
          .timeout(_timeoutDuration);
      if (response.statusCode == 200) {
        return RestaurantListResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load list of restaurant');
      }
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request time out. Please try again later.');
    } on FormatException {
      throw Exception('Failed to load list of restaurant');
    } catch (e) {
      rethrow;
    }
  }
}
