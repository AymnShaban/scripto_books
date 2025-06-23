import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/book_and_details_list_view_item.dart';

class BookAndDetailsListView extends StatelessWidget {
  const BookAndDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GestureDetector(
                onTap: () {},
                child:
                    BookAndDetailsListViewItem()
                        .animate()
                        .flipH(duration: Duration(seconds: 1))
                        .slideY()
                        .slideX(),
              ),
            ),
      ),
    );
  }
}
