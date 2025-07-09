import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/Features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:scripto_books/Features/search/presentation/views/widgets/book_and_details_list_view_for_search.dart';
import 'package:scripto_books/Features/search/presentation/views/widgets/custom_search_text_filed.dart';
import 'package:scripto_books/core/utils/styles.dart';
import 'package:scripto_books/core/widgets/loading_probability.dart';

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
              CustomSearchTextFiled(
                onChanged: (data) {
                  BlocProvider.of<SearchCubit>(
                    context,
                  ).fetchSearchBooks(query: data);
                },
              ),
              SizedBox(height: 20),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSuccessState) {
                    return BookAndDetailsListViewForSearch(
                      books: state.booksModel,
                    );
                  } else if (state is SearchLoadingState) {
                    return SizedBox(child: LoadingProbability());
                  } else if (state is SearchLoadingState) {
                    return Center(
                      child: Text(state.toString(), style: Styles.textStyle30),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
