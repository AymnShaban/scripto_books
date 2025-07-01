import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/Features/home/presentation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/books_actions.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_books_item.dart';
import 'package:scripto_books/core/utils/styles.dart';
import 'package:scripto_books/core/widgets/error_message_widget.dart';
import 'package:scripto_books/core/widgets/loading_probability.dart';

import '../../../../../core/utils/network_images.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookDetailsCubit, BookDetailsState>(
      builder: (context, state) {
        if (state is BookDetailSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  // if this file has a lot of lines (so i can separate the code in two or three sections )
                  children: [
                    CustomBookDetailsAppBar()
                        .animate()
                        .slideX(duration: Duration(seconds: 1))
                        .slideY(),
                    SizedBox(height: 25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: CustomBooksItem(
                        aspectRatio: 2.7 / 4,
                        radius: 16,
                        image: state.book.image ?? NetworkImagesData.bookOne,
                      ).animate().flipH(duration: Duration(seconds: 1)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      state.book.title ?? 'The Jungle Book',
                      style: Styles.textStyle30,
                    ).animate().slideY(duration: Duration(seconds: 1)).slideX(),
                    SizedBox(height: 6),
                    Text(
                      state.book.authors ?? 'Rudyard Kipling',
                      style: Styles.textStyle16.copyWith(
                        color: Color(0xff797885),
                      ),
                    ).animate().slideY(duration: Duration(seconds: 1)).slideX(),
                    SizedBox(height: 6),

                    Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      state.book.subtitle ?? 'SubTitle for this book ',
                      style: Styles.textStyle16.copyWith(
                        color: Color(0xff797885),
                      ),
                    ).animate().slideY(duration: Duration(seconds: 1)).slideX(),
                    SizedBox(height: 40),
                    BooksActions(
                      onPressedDownload: () {
                        state.book.download;
                      },

                      onPressedPreview: () {},
                    ).animate().shake(duration: Duration(seconds: 1)),
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          );
        } else if (state is BookDetailsFailureState) {
          return ErrorMessageWidget(errorMessage: state.errorMessage);
        } else {
          return LoadingProbability();
        }
      },
    );
  }
}
