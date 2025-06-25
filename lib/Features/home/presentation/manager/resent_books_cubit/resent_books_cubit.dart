import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo.dart';

part 'resent_books_state.dart';

class ResentBooksCubit extends Cubit<ResentBooksState> {
  ResentBooksCubit(this.homeRepo) : super(ResentBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchResentBooks() async {
    emit(ResentBooksLoadingState());
    var result = await homeRepo.fetchRecentBooks();
    result.fold(
      (failure) {
        emit(ResentBooksFailureState(failure.errMessage));
      },
      (books) {
        emit(ResentBooksSuccess(books));
      },
    );
  }
}
