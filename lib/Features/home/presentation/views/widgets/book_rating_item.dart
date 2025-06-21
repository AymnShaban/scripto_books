import 'package:flutter/material.dart';
import 'package:scripto_books/core/utils/styles.dart';

class BookRatingItem extends StatelessWidget {
  const BookRatingItem({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Icon(Icons.star, color: Colors.yellow, size: 18),
        SizedBox(width: 5.6),
        Text('4.5', style: Styles.textStyle18),
        SizedBox(width: 6),
        Text('(4325)', style: Styles.textStyle14.copyWith(color: Colors.grey)),

      ],
    );
  }
}
