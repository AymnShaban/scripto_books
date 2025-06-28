import 'package:flutter/material.dart';
import 'package:scripto_books/core/utils/styles.dart';

import 'custom_books_item.dart';

class BookAndDetailsListViewItem extends StatelessWidget {
  const BookAndDetailsListViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.author,
    required this.image,
  });

  final String title;
  final String subTitle;
  final String price;
  final String author;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: CustomBooksItem(
              aspectRatio: 2.5 / 4,
              radius: 8,
              image: image,
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
                    title,
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text(price, style: Styles.textStyle20),
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .24,
                      child: Text(
                        author,
                        style: Styles.textStyle14.copyWith(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
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
