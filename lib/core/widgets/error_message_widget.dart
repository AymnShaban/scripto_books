import 'package:flutter/material.dart';
import 'package:scripto_books/core/utils/styles.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage, style: Styles.textStyle14);
  }
}
