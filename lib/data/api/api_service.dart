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
}
