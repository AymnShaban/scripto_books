import 'package:flutter/material.dart';

class CustomBooksItem extends StatelessWidget {
  const CustomBooksItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .22,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://tse1.mm.bing.net/th?id=OIP.QaqDrHSrWeTxrJVVkIYl4QHaL2&pid=Api',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
