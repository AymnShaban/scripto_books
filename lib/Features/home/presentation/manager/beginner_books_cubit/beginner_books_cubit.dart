
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo.dart';

part 'beginner_books_state.dart';

class BeginnerBooksCubit extends Cubit<BeginnersBooksState> {
  BeginnerBooksCubit(this.homeRepo) : super(BeginnersBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchBeginnersBooks() async {
    emit(BeginnersBooksLoadingState());
    var result = await homeRepo.fetchBeginnersBooks();
    result.fold(
      (failure) {
        emit(BeginnersBooksFailureState(failure.errMessage));
      },
      (books) {
        emit(BeginnersBooksSuccessState(books));
      },
    );
  }
}
