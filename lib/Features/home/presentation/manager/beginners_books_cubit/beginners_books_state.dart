part of 'beginners_books_cubit.dart';

@immutable
sealed class BeginnersBooksState {}

final class BeginnersBooksInitial extends BeginnersBooksState {}

final class BeginnersBooksLoadingState extends BeginnersBooksState {}

final class BeginnersBooksFailureState extends BeginnersBooksState {
  final String errorMessage;

  BeginnersBooksFailureState(this.errorMessage);
}

final class BeginnersBooksSuccessState extends BeginnersBooksState {
  final List<BooksModel> books;

  BeginnersBooksSuccessState(this.books);
}
