part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

final class BookDetailSuccessState extends BookDetailsState {
  final DetailsModel book;

  BookDetailSuccessState(this.book);
}

final class BookDetailsFailureState extends BookDetailsState {
  final String errorMessage;

  BookDetailsFailureState(this.errorMessage);
}

final class BookDetailsLoadingState extends BookDetailsState {}
