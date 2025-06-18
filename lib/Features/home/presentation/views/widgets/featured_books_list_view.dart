import 'package:flutter/material.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_books_item.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .22,

      child: ListView.builder(
        itemBuilder: (context, index) => CustomBooksItem(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
