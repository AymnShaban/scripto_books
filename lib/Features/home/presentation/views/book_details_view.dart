import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scripto_books/Features/home/presentation/manager/book_details_cubit/book_details_cubit.dart';
import 'package:scripto_books/Features/home/presentation/views/widgets/book_details_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.id});

  final String id;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<BookDetailsCubit>(context).fetchDetailsBook(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDetailsBody());
  }
}
