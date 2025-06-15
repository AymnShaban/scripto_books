import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scripto_books/constants.dart';

import 'Features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const ScriptoApp());
}

class ScriptoApp extends StatelessWidget {
  const ScriptoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: kPrimaryColor),
      home: const SplashView(),
    );
  }
}
