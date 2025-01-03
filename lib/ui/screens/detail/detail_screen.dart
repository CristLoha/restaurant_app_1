import 'package:flutter/material.dart';
import '../../../utils/theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContentDetailWidget();
  }
}

class BuildContentDetailWidget extends StatelessWidget {
  const BuildContentDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (AppBar(
        title: Text('Detail Restoran'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: AppColors.primary,
            ),
            onPressed: () {},
          ),
        ],
      )),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Image.network(
              'https://restaurant-api.dicoding.dev/images/medium/14',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Melting Pot",
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
                    SizedBox(width: 4),
                    Text(
                      'Yogyakarta, Jln. Pandeglang no 19',
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
                    SizedBox(width: 4),
                    Text(
                      '4.5',
                      style: AppTextStyles.textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Restoran ini merupakan restoran yang sangat cocok untuk makan malam bersama keluarga dan teman-teman. Menu yang disajikan pun sangat beragam dan lezat.',
                  style: AppTextStyles.textTheme.bodyMedium,
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16),
                Text(
                  "Menu",
                  style: AppTextStyles.textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuCardWidget(),
                      MenuCardWidget(),
                      MenuCardWidget(),
                      MenuCardWidget(),
                      MenuCardWidget(),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Review",
                  style: AppTextStyles.textTheme.titleLarge,
                ),
                SizedBox(height: 8),
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 40,
                    color: AppColors.grey,
                  ),
                  title: Text(
                    'Rizal',
                    style: AppTextStyles.textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    'Makanannya enak dan pelayanannya sangat ramah',
                    style: AppTextStyles.textTheme.bodyMedium,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 40,
                    color: AppColors.grey,
                  ),
                  title: Text(
                    'Fadil',
                    style: AppTextStyles.textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    'Tempatnya nyaman dan bersih',
                    style: AppTextStyles.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          'Fried Rice',
          style: AppTextStyles.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
