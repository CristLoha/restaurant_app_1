import 'category.dart';
import 'customer_review.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menus menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return RestaurantDetail(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      city: json['city'],
      address: json['address'],
      pictureId: json['pictureId'],
      categories: (json['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
      menus: Menus.fromJson(json['menus']),
      rating: (json['rating'] as num).toDouble(),
      customerReviews: (json['customerReviews'] as List)
          .map((e) => CustomerReview.fromJson(e))
          .toList(),
    );
  }
}
