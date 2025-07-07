import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/constants.dart';
import 'package:scripto_books/core/utils/app_router.dart';
import 'package:scripto_books/core/utils/direct_download.dart';
import 'package:scripto_books/core/utils/providers.dart';
import 'package:scripto_books/core/utils/service_locator.dart';

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
      providers: generalBlocProviders,
      child: MaterialApp.router(
        scaffoldMessengerKey: scaffoldMessengerKey,
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
