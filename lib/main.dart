import 'package:flutter/material.dart';
import 'package:scripto_books/constants.dart';
import 'package:scripto_books/core/utils/app_router.dart';

void main() {
  runApp(const ScriptoApp());
}

class ScriptoApp extends StatelessWidget {
  const ScriptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor,

      ),
    );
  }
}
