import 'package:dartz/dartz.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo.dart';
import 'package:scripto_books/core/errors/failures.dart';
import 'package:scripto_books/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failures, List<BooksModel>>> fetchRecentBooks() async {
    try {
      var data = await apiService.get(endPoint: 'recent');
      List<BooksModel> books = [];
      for (var item in data['books']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failures, List<BooksModel>>> fetchFeaturedBooks() {
    throw UnimplementedError();
  }
}
