import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:scripto_books/core/utils/styles.dart';
import 'book_and_details_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: CustomAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child:
                    Text("Books For Beginners", style: Styles.textStyle20)
                        .animate()
                        .flipH(duration: Duration(seconds: 1))
                        .slideY()
                        .slideX(),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        BookAndDetailsListView(),
      ],
    );
  }
}
