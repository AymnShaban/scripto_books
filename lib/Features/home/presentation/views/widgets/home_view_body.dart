import 'package:flutter/material.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_app_bar.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       CustomAppBar()

      ]
    );
  }
}
