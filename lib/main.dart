import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scripto_books/Features/home/presentation/views/home_view.dart';
import 'package:scripto_books/constants.dart';

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
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor,

      ),
      home: HomeView(),
    );
  }
}
