import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo_implement.dart';
import 'package:scripto_books/Features/home/presentation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:scripto_books/Features/home/presentation/views/book_details_view.dart';
import 'package:scripto_books/Features/search/presentation/views/search_view.dart';
import 'package:scripto_books/core/utils/service_locator.dart';

import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = "/homeView";
  static const kBookDetailsView = "/bookDetailsView";
  static const kSearchView = "/searchView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBookDetailsView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => BookDetailsCubit(getIt.get<HomeRepoImpl>()),
              child: BookDetailsView(id: state.extra as String,),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
