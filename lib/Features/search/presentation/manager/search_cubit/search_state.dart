part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}
final class SearchChangeResultState extends SearchState {}

final class SearchLoadingState extends SearchState {}

final class SearchSuccessState extends SearchState {
  final List<BooksModel> booksModel;

  SearchSuccessState(this.booksModel);
}

final class SearchFailureState extends SearchState {
  final String errMessage;

  SearchFailureState(this.errMessage);
}
