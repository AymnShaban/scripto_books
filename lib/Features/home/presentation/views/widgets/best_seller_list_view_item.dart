import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/book_rating_item.dart';
import 'package:scripto_books/core/utils/styles.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/network_images.dart';
import 'custom_books_item.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              GoRouter.of(context).push(AppRouter.kBookDetailsView);

            },
            child: CustomBooksItem(
              aspectRatio: 2.5 / 4,
              radius: 8,
              image: NetworkImagesData.bookTwo,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .6,
                  child: Text(
                    'Aymn Shaban and the best 5 programmers ',
                    style: Styles.textStyle20,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Aymn Shaban',
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      '19.99 €',
                      style: Styles.textStyle20),
                    Spacer(),
                    BookRatingItem()
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
