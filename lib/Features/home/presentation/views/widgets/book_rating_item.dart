import 'package:flutter/material.dart';
import 'package:scripto_books/core/utils/styles.dart';

class BookRatingItem extends StatelessWidget {
  const BookRatingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.yellow),
        SizedBox(width: 5.6),
        Text('4.5', style: Styles.textStyle16),
        SizedBox(width: 6),
        Text('(4325)', style: Styles.textStyle14.copyWith(color: Colors.grey)),
      ],
    );
  }
}
