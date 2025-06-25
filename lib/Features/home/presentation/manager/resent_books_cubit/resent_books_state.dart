part of 'resent_books_cubit.dart';

@immutable
sealed class ResentBooksState {}

final class ResentBooksInitial extends ResentBooksState {}

final class ResentBooksLoadingState extends ResentBooksState {}

final class ResentBooksFailureState extends ResentBooksState {
  final String errorMessage;

  ResentBooksFailureState(this.errorMessage);
}

final class ResentBooksSuccess extends ResentBooksState {
  final List<BooksModel> books;

  ResentBooksSuccess(this.books);
}
