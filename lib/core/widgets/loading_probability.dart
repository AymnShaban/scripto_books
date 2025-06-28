import 'package:flutter/material.dart';

import '../utils/styles.dart';

class LoadingProbability extends StatelessWidget {
  const LoadingProbability({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Books will be ready \n Please stay here ☺ ",
        style: Styles.textStyle30,
      ),
    );
  }
}
