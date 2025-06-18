import 'package:flutter/material.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_books_item.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 10,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         CustomAppBar(),
          CustomBooksItem()

        ]
      ),
    );
  }
}
