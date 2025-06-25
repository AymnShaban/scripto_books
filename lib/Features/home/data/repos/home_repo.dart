import 'package:dartz/dartz.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BooksModel>>> fetchRecentBooks();

  Future<Either<Failure, List<BooksModel>>> fetchBeginnersBooks();
}
