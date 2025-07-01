import 'package:flutter/material.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/core/utils/styles.dart';

import '../../../../../core/utils/network_images.dart';
import 'custom_books_item.dart';

class BookAndDetailsListViewItem extends StatelessWidget {
  const BookAndDetailsListViewItem({
    super.key,
    required this.books
  });

  final BooksModel books;

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
              image: books.image ?? NetworkImagesData.bookOne,
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
                    books.title ?? 'Try again bro ',
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  books.subtitle ?? 'I\'ll tell you everything bro but please wait 😶',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Text('Free 😀', style: Styles.textStyle20),
                    Spacer(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .24,
                      child: Text(
                        books.authors ?? 'Waiting bro',
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