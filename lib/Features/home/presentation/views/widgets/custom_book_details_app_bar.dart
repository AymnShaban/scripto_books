import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scripto_books/core/utils/assets.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetsData.closeIcon, height: 30),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetsData.shoppingIcon, height: 35),
        ),
      ],
    );
  }
}
