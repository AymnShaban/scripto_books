import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/core/utils/app_router.dart';

class CustomBooksItem extends StatelessWidget {
  const CustomBooksItem({
    super.key,
    required this.aspectRatio,
    required this.radius,
    required this.image,
  });

  final double aspectRatio;
  final double radius;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
