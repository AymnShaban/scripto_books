import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo.dart';
import 'package:scripto_books/core/errors/failures.dart';
import 'package:scripto_books/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BooksModel>>> fetchRecentBooks() async {
    try {
      var data = await apiService.get(endPoint: 'recent');
      List<BooksModel> books = [];
      for (var item in data['books']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
      return left(
        ServerFailure.fromDioError(e),
      );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetchBeginnersBooks() async{
    try {
      var data = await apiService.get(endPoint: 'search/beginners');
      List<BooksModel> books = [];
      for (var item in data['books']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
