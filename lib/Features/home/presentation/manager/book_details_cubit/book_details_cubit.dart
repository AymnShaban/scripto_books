import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/Features/home/data/models/details_model.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit(this.homeRepo) : super(BookDetailsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchDetailsBook({required String id}) async {
    emit(BookDetailsLoadingState());
    var result = await homeRepo.fetchBookDetails(bookId: id);
    result.fold(
      (failure) {
        emit(BookDetailsFailureState(failure.errMessage));
      },
      (book) {
        emit(BookDetailSuccessState(book));
      },
    );
  }
}
