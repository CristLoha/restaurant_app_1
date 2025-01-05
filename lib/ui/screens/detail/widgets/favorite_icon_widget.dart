import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app_1/data/model/restaurant.dart';
import 'package:restaurant_app_1/provider/detail/favorite_icon_provider.dart';
import 'package:restaurant_app_1/provider/detail/favorite_list_provider.dart';
import '../../../../utils/theme.dart';

class FavoriteIconWidget extends StatefulWidget {
  final Restaurant restaurant;
  const FavoriteIconWidget({
    super.key,
    required this.restaurant,
  });

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  void initState() {
    final favoriteListProvider = context.read<FavoriteListProvider>();
    final favoriteIconProvider = context.read<FavoriteIconProvider>();

    Future.microtask(() {
      final favoriteInList =
          favoriteListProvider.checkItemFavorite(widget.restaurant);
      favoriteIconProvider.isFavorite = favoriteInList;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final favoriteListProvider = context.read<FavoriteListProvider>();
        final favoriteIconProvider = context.read<FavoriteIconProvider>();
        final isFavorite = favoriteIconProvider.isFavorite;

        if (isFavorite) {
          favoriteListProvider.removeFavorite(widget.restaurant);
        } else {
          favoriteListProvider.addFavorite(widget.restaurant);
        }
        context.read<FavoriteIconProvider>().isFavorite = !isFavorite;
      },
      icon: Icon(
        context.watch<FavoriteIconProvider>().isFavorite
            ? Icons.favorite
            : Icons.favorite_outline,
        color: AppColors.primary,
      ),
    );
  }
}
