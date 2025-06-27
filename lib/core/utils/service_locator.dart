import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo_implement.dart';
import 'package:scripto_books/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
