import 'package:flutter/material.dart';
import '../../../../utils/theme.dart';

class CustomerReviewWidget extends StatelessWidget {
  final String name;
  final String review;
  final String date;

  const CustomerReviewWidget({
    super.key,
    required this.name,
    required this.review,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(
        Icons.account_circle,
        size: 40,
        color: AppColors.grey,
      ),
      title: Text(
        name,
        style: AppTextStyles.textTheme.titleMedium,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review,
            style: AppTextStyles.textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: AppTextStyles.textTheme.bodySmall?.copyWith(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
