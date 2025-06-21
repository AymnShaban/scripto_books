import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/book_rating_item.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/books_actions.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/custom_books_item.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:scripto_books/core/utils/network_images.dart';
import 'package:scripto_books/core/utils/styles.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomBookDetailsAppBar().animate().slideX(duration: Duration(seconds: 1)).slideY(),
              SizedBox(height: 25),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90),
                child: CustomBooksItem(
                  aspectRatio: 2.7 / 4,
                  radius: 16,
                  image: NetworkImagesData.bookOne,
                ).animate().flipH(duration: Duration(seconds: 1)),
              ),
              SizedBox(height: 20),
              Text('The Jungle Book', style: Styles.textStyle30).animate().slideY(duration: Duration(seconds: 1)).slideX(),
              SizedBox(height: 6),
              Text(
                'Rudyard Kipling',
                style: Styles.textStyle16.copyWith(color: Color(0xff797885)),
              ).animate().slideY(duration: Duration(seconds: 1)).slideX(),
              SizedBox(height: 20),

              BookRatingItem(mainAxisAlignment: MainAxisAlignment.center).animate().slideY(duration: Duration(seconds: 1)).slideX(),
              SizedBox(height: 40),
              BooksActions().animate().shake(duration: Duration(seconds: 1)),
              SizedBox(height: 70),
              Row(
                children: [Text('You can also like', style: Styles.textStyle20).animate().slideY(duration: Duration(seconds: 1)).slideX()],
              ),
              SizedBox(height: 15),

              FeaturedBooksListView(height: .15, aspectRatio: 2.25 / 4),
            ],
          ),
        ),
      ),
    );
  }
}
