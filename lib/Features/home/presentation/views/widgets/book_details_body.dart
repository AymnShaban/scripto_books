import 'package:flutter/widgets.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_books_item.dart';
import 'package:scripto_books/core/utils/network_images.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SafeArea(
        child:  Column(
          children: [
            CustomBookDetailsAppBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: CustomBooksItem(aspectRatio: 2.7/4, radius: 16, image: NetworkImagesData.bookOne),
            )
          ],
        ),
      ),
    );
  }
}
