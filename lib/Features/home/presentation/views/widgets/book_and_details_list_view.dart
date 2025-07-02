import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/Features/home/presentation/manager/beginner_books_cubit/beginner_books_cubit.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/book_and_details_list_view_item.dart';
import 'package:scripto_books/core/utils/app_router.dart';
import 'package:scripto_books/core/widgets/error_message_widget.dart';
import 'package:scripto_books/core/widgets/loading_probability.dart';

class BookAndDetailsListView extends StatelessWidget {
  const BookAndDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeginnerBooksCubit, BeginnersBooksState>(
      builder: (context, state) {
        if (state is BeginnersBooksSuccessState) {
          return SliverList.builder(
            itemCount: state.books.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.books[index].id,
                      );
                    },
                    child:
                        BookAndDetailsListViewItem(books: state.books[index])
                            .animate()
                            .flipH(duration: Duration(seconds: 1))
                            .slideY()
                            .slideX(),
                  ),
                ),
          );
        } else if (state is BeginnersBooksFailureState) {
          return SliverToBoxAdapter(
            child: Center(
              child: ErrorMessageWidget(errorMessage: state.errorMessage),
            ),
          );
        } else {
          return SliverToBoxAdapter(child: LoadingProbability());
        }
      },
    );
  }
}


