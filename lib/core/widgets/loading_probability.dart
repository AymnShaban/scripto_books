import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Features/home/presentation/views/widgets/custom_books_item.dart';
import '../utils/network_images.dart';

class LoadingProbability extends StatelessWidget {
  const LoadingProbability({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSkeletonizerItem(),
        CustomSkeletonizerItem(),
        CustomSkeletonizerItem(),
        CustomSkeletonizerItem(),
        CustomSkeletonizerItem(),
        CustomSkeletonizerItem(),
        CustomSkeletonizerItem(),
      ],
    );
  }
}


class CustomSkeletonizerItem extends StatelessWidget {
  const CustomSkeletonizerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      enabled: true,
      child: ListTile(
        title: Text('anything anything '),
        leading: CustomBooksItem( aspectRatio: 2.5 / 4,
            radius: 8, image: NetworkImagesData.aymn),
        subtitle: Text('anything anything '),
      ),
    );
  }
}
