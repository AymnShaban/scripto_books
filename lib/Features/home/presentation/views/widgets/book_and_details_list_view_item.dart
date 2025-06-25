import 'package:flutter/material.dart';
import 'package:scripto_books/core/utils/styles.dart';

import '../../../../../core/utils/network_images.dart';
import 'custom_books_item.dart';

class BookAndDetailsListViewItem extends StatelessWidget {
  const BookAndDetailsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){

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
                    'Title \n title ',
                    style: Styles.textStyle20,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'SubTitle ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(
                      'Free 😊',
                      style: Styles.textStyle20),
                    Spacer(),
                    Text(
                      'Aymn Shaban',
                      style: Styles.textStyle14.copyWith(color: Colors.grey),
                    ),
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
