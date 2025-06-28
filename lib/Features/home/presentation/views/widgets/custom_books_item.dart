import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scripto_books/core/utils/assets.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: image,
            placeholder: (context, url) => Image.asset(AssetsData.aymnBook),
            errorWidget: (context, url, error) => Image.asset(AssetsData.errorBook),
          ),
        ),
      ),
    );
  }
}