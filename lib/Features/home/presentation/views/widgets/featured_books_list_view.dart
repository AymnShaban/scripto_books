import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_books_item.dart';
import 'package:scripto_books/core/utils/network_images.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .22,

      child: ListView.builder(
        itemBuilder:
            (context, index) => CustomBooksItem(
              aspectRatio: 2.7 / 4,
              radius: 16,
              image: NetworkImagesData.bookOne,
            ).animate().flip(duration: Duration(milliseconds: 1500)),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
