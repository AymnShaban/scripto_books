import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/Features/home/presentation/manager/resent_books_cubit/resent_books_cubit.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_books_item.dart';
import 'package:scripto_books/core/utils/app_router.dart';
import 'package:scripto_books/core/widgets/error_message_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/network_images.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
    this.height = .22,
    this.aspectRatio = 2.7 / 4,
  });

  final double height;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResentBooksCubit, ResentBooksState>(
      builder: (context, state) {
        if (state is ResentBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * height,

            child: ListView.builder(
              itemBuilder:
                  (context, index) => GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: state.books[index].id);
                    },
                    child: CustomBooksItem(
                      aspectRatio: aspectRatio,
                      radius: 16,
                      image: state.books[index].image ?? NetworkImagesData.bookOne,
                    ).animate().flip(duration: Duration(milliseconds: 1500)),
                  ),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else if (state is ResentBooksFailureState) {
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * height,
              child: ErrorMessageWidget(errorMessage: state.errorMessage),
            ),
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * height,

            child: Skeletonizer(
              enabled: true,
              child: ListView.builder(
                itemBuilder:
                    (context, index) => CustomBooksItem(
                      aspectRatio: aspectRatio,
                      radius: 16,
                      image: NetworkImagesData.bookOne,
                    ),
                itemCount: 7,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        }
      },
    );
  }
}
