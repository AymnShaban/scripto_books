import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/book_and_details_list_view_item.dart';
import 'package:scripto_books/core/utils/app_router.dart';

class BookAndDetailsListViewForSearch extends StatelessWidget {
  const BookAndDetailsListViewForSearch({super.key, required this.books});

  final List<BooksModel> books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder:
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kBookDetailsView, extra: books[index].id);
                },
                child:
                    BookAndDetailsListViewItem(books: books[index])
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
