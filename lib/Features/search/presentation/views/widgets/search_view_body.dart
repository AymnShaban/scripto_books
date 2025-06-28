import 'package:flutter/material.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/search/presentation/views/widgets/custom_search_text_filed.dart';
import 'package:scripto_books/Features/search/presentation/views/widgets/book_and_details_list_view_for_search.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomSearchTextFiled(),
              SizedBox(height: 20),
              BookAndDetailsListViewForSearch(books: BooksModel()),
            ],
          ),
        ),
      ),
    );
  }
}
