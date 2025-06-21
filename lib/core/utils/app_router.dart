import 'package:go_router/go_router.dart';
import 'package:scripto_books/Features/home/presentation/views/book_details_view.dart';

import '../../Features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kHomeView = "/homeView";
  static const kBookDetailsView = "/bookDetailsView";
  static final router = GoRouter(
    routes: [
      // GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => const BookDetailsView(),
      ),
    ],
  );
}
