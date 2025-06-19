import 'package:flutter/material.dart';

import '../../../../../core/utils/network_images.dart';
import 'custom_books_item.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          CustomBooksItem(aspectRatio: 2.5 / 4,radius: 8,image: NetworkImagesData.bookTwo,)
        ],
      ),
    );
  }
}
