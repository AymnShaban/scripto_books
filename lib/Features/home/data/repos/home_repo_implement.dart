import 'package:dartz/dartz.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo.dart';
import 'package:scripto_books/core/errors/failures.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Future<Either<Failures, List<BooksModel>>> fetchBestSellerBooks() {

    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<BooksModel>>> fetchFeaturedBooks() {

    throw UnimplementedError();
  }
}