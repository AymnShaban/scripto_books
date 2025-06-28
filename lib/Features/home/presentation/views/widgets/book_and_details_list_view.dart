import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/Features/home/presentation/manager/beginner_books_cubit/beginner_books_cubit.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/book_and_details_list_view_item.dart';
import 'package:scripto_books/core/utils/app_router.dart';
import 'package:scripto_books/core/utils/network_images.dart';
import 'package:scripto_books/core/widgets/error_message_widget.dart';

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
                      GoRouter.of(context).push(AppRouter.kBookDetailsView);
                    },
                    child:
                        BookAndDetailsListViewItem(
                              image: state.books[index].image ?? NetworkImagesData.bookOne ,
                              title: state.books[index].title ?? 'Try again bro ',
                              author: state.books[index].authors ?? 'Waiting bro',
                              price: 'Free 😀',
                              subTitle: state.books[index].subtitle??'I\'ll tell you everything bro but please wait 😶' ,
                            )
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
          return SliverList.builder(
            itemCount: 20,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView);
                    },
                    child:
                        BookAndDetailsListViewItem(
                              subTitle: '',
                              price: '',
                              author: '',
                              title: '',
                              image: '',
                            )
                            .animate()
                            .flipH(duration: Duration(seconds: 1))
                            .slideY()
                            .slideX(),
                  ),
                ),
          );
        }
      },
    );
  }
}
