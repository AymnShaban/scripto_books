import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String query}) async {
    emit(SearchLoadingState());
    var result = await searchRepo.fetchSearchBooks(query: query);
    result.fold(
      (failure) {
        emit(SearchFailureState(failure.toString()));
      },
      (books) {
        emit(SearchSuccessState(books));
      },
    );
  }

}
