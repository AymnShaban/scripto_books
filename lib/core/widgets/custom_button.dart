import 'package:flutter/material.dart';
import 'package:scripto_books/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    this.text = 'MyButton',
    this.borderRadius,
    this.backGroundColor,
    this.textColor,
  });

  final void Function() onPressed;
  final String text;
  final BorderRadiusGeometry? borderRadius;
  final Color? backGroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(16),
          ),
          backgroundColor: backGroundColor ?? Colors.white,
        ),
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textColor ?? Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
