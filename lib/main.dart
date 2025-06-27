import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/Features/home/data/repos/home_repo_implement.dart';
import 'package:scripto_books/constants.dart';
import 'package:scripto_books/core/utils/app_router.dart';
import 'package:scripto_books/core/utils/service_locator.dart';

import 'Features/home/presentation/manager/beginner_books_cubit/beginner_books_cubit.dart';
import 'Features/home/presentation/manager/resent_books_cubit/resent_books_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const ScriptoApp());
}

class ScriptoApp extends StatelessWidget {
  const ScriptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BeginnerBooksCubit>(
          create: (context) => BeginnerBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
        BlocProvider<ResentBooksCubit>(
          create: (context) => ResentBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
