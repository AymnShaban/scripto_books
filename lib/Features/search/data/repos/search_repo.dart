import 'package:dartz/dartz.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';

abstract class SearchRepo{

  Future<Either<Future,List<BooksModel>>> fetchSearchBooks({required String query});

}