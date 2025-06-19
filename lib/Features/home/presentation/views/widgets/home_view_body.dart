import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:scripto_books/core/utils/styles.dart';
import 'best_seller_list_view_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 20),
          Text(
            "Best Seller",
            style: Styles.textStyle20,
          ).animate().flipH(duration: Duration(seconds: 1)).slideY().slideX(),
          SizedBox(height: 10),
          BestSellerListViewItem().animate().flipH(duration: Duration(seconds: 1)).slideY().slideX(),
        ],
      ),
    );
  }
}
