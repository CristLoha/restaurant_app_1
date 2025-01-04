import 'package:flutter/material.dart';
import 'package:restaurant_app_1/data/model/restaurant_detail.dart';
import '../../../../utils/image.util.dart';
import '../../../../utils/theme.dart';
import 'customer_review_widget.dart';
import 'menu_card_widget.dart';

class ContentDetailWidget extends StatelessWidget {
  final RestaurantDetail restaurantDetail;
  const ContentDetailWidget({
    super.key,
    required this.restaurantDetail,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Hero(
            tag: restaurantDetail.pictureId,
            child: Image.network(
              getRestaurantImageUrl(
                restaurantDetail.pictureId,
              ),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            restaurantDetail.name,
            style: AppTextStyles.textTheme.headlineMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: AppColors.grey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${restaurantDetail.city}, ${restaurantDetail.address}",
                    style: AppTextStyles.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${restaurantDetail.rating}',
                    style: AppTextStyles.textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                restaurantDetail.description,
                style: AppTextStyles.textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16),
              Text(
                "Menu Makanan",
                style: AppTextStyles.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: restaurantDetail.menus.foods
                      .map((food) => MenuCardWidget(menuName: food.name))
                      .toList(),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Menu Minuman",
                style: AppTextStyles.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: restaurantDetail.menus.drinks
                      .map((drink) => MenuCardWidget(menuName: drink.name))
                      .toList(),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Review",
                style: AppTextStyles.textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Column(
                children: restaurantDetail.customerReviews
                    .map(
                      (review) => CustomerReviewWidget(
                        name: review.name,
                        review: review.review,
                        date: review.date,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
