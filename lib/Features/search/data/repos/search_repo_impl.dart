import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:scripto_books/Features/home/data/models/books_model.dart';
import 'package:scripto_books/Features/search/data/repos/search_repo.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Future, List<BooksModel>>> fetchSearchBooks({
    required String query,
  }) async {
    try {
      var data = await apiService.get(endPoint: 'search/$query');
      List<BooksModel> books = [];
      for (var item in data['books']) {
        books.add(BooksModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e) as Future);
      }
      return left(ServerFailure(e.toString()) as Future);
    }
  }
}
