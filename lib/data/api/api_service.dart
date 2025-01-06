import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:restaurant_app_1/data/model/restaurant_list_response.dart';
import 'package:restaurant_app_1/data/model/restaurant_detail_response.dart';

import '../model/restaurant_search_response.dart';

class ApiService {
  static final String _baseUrl = 'https://restaurant-api.dicoding.dev';
  static const String _listEndpoint = '/list';
  static const String _detailEndpoint = '/detail/';
  static const String _searchEndpoint = '/search?q=';
  static const Duration _timeoutDuration = Duration(seconds: 10);

  Future<RestaurantListResponse> getRestaruantList() async {
    try {
      final response = await http
          .get(Uri.parse("$_baseUrl$_listEndpoint"))
          .timeout(_timeoutDuration);
      if (response.statusCode == 200) {
        return RestaurantListResponse.fromJson(json.decode(response.body));
      } else {
        throw 'Gagal memuat daftar restoran.';
      }
    } on SocketException {
      throw 'Tidak ada koneksi internet. Periksa jaringan Anda.';
    } on TimeoutException {
      throw 'Permintaan melebihi waktu tunggu. Coba lagi nanti.';
    } on FormatException {
      throw 'Gagal memuat daftar restoran.';
    } catch (e) {
      throw 'Terjadi kesalahan. Coba lagi nanti.';
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    try {
      final response = await http
          .get(Uri.parse("$_baseUrl$_detailEndpoint$id"))
          .timeout(_timeoutDuration);
      if (response.statusCode == 200) {
        return RestaurantDetailResponse.fromJson(json.decode(response.body));
      } else {
        throw 'Gagal memuat detail restoran.';
      }
    } on SocketException {
      throw 'Tidak ada koneksi internet. Periksa jaringan Anda.';
    } on TimeoutException {
      throw 'Permintaan melebihi waktu tunggu. Coba lagi nanti.';
    } on FormatException {
      throw 'Gagal memuat detail restoran.';
    } catch (e) {
      throw 'Terjadi kesalahan. Coba lagi nanti.';
    }
  }

  Future<RestaurantSearchResponse> searchRestaurant(String query) async {
    try {
      final response = await http
          .get(Uri.parse("$_baseUrl$_searchEndpoint$query"))
          .timeout(_timeoutDuration);
      print('Response Body: ${response.body}'); // Debugging: Lihat response API

      if (response.statusCode == 200) {
        return RestaurantSearchResponse.fromJson(json.decode(response.body));
      } else {
        throw 'Gagal mencari restoran.';
      }
    } catch (e) {
      print('Error: $e');
      throw 'Terjadi kesalahan. Coba lagi nanti.';
    }
  }
}
