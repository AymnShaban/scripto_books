import 'package:flutter/material.dart';
import 'package:scripto_books/core/widgets/custom_button.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({
    super.key,
    required this.onPressedDownload,
    required this.onPressedPreview,


  });

  final void Function() onPressedDownload;
  final void Function() onPressedPreview;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onPressed: onPressedDownload,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
          text:'Free Download',
        ),
        CustomButton(
          onPressed: onPressedPreview,
          textColor: Colors.white,
          backGroundColor: Color(0xffEF8363),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          text:'Free Preview',
        ),
      ],
    );
  }
}
