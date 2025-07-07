import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/Features/home/presentation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/book_details_text16.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/books_actions.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_books_item.dart';
import 'package:scripto_books/core/utils/styles.dart';
import 'package:scripto_books/core/widgets/error_message_widget.dart';

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
                    CustomBookDetailsAppBar(),
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
                    BookDetailsText16(
                      text:
                          "• Authors: ${state.book.authors ?? 'Rudyard Kipling'}",
                    ),
                    SizedBox(height: 6),
                    BookDetailsText16(
                      text:
                          "• SubTitle: ${state.book.subtitle ?? 'subtitle subtitle subtitle subtitle'}",
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        BookDetailsText16(
                          text: "• Pages: ${state.book.pages ?? '000'} ",
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    BookDetailsText16(
                      text:
                          "• Description: ${state.book.description ?? 'Description for this book '}",
                    ),
                    SizedBox(height: 40),
                    BooksActions(detailsModel: state.book),
                    SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          );
        } else if (state is BookDetailsFailureState) {
          return ErrorMessageWidget(errorMessage: state.errorMessage);
        } else {
          return Container();
        }
      },
    );
  }
}
