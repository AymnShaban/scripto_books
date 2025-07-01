import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/utils/styles.dart';

class BookDetailsText16 extends StatelessWidget {
  const BookDetailsText16({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.left,
      text,
      style: Styles.textStyle16.copyWith(color: Color(0xff797885)),
    ).animate().slideY(duration: Duration(seconds: 1)).slideX();
  }
}
