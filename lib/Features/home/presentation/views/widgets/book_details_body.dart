import 'package:flutter/widgets.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SafeArea(
        child: const Column(
          children: [
            CustomBookDetailsAppBar()
          ],
        ),
      ),
    );
  }
}
