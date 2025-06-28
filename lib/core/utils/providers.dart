import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/core/utils/service_locator.dart';

import '../../Features/home/data/repos/home_repo_implement.dart';
import '../../Features/home/presentation/manager/beginner_books_cubit/beginner_books_cubit.dart';
import '../../Features/home/presentation/manager/resent_books_cubit/resent_books_cubit.dart';

List<BlocProvider> generalBlocProviders = [
  BlocProvider<BeginnerBooksCubit>(
    create:
        (context) =>
            BeginnerBooksCubit(getIt.get<HomeRepoImpl>())
              ..fetchBeginnersBooks(),
  ),
  BlocProvider<ResentBooksCubit>(
    create: (context) => ResentBooksCubit(getIt.get<HomeRepoImpl>())..fetchResentBooks(),
  ),
];
