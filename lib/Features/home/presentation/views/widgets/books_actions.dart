import 'package:flutter/material.dart';
import 'package:scripto_books/Features/home/data/models/details_model.dart';
import 'package:scripto_books/core/widgets/download/direct_download.dart';
import 'package:scripto_books/core/utils/storage_permission.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.detailsModel});

  final DetailsModel detailsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onPressed: () {
            requestStoragePermission(context);
            downloadToDownloadsFolder(
              detailsModel.download!,
              '${detailsModel.title}.pdf',
            );
          },
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
          text: 'Free Download',
        ),
        CustomButton(
          onPressed: () async {
            Uri uri = Uri.parse(detailsModel.url!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            }
          },
          textColor: Colors.white,
          backGroundColor: Color(0xffEF8363),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(12),
          ),

          text: 'Free Preview',
        ),
      ],
    );
  }
}
