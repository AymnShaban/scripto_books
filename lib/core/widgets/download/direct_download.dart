import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scripto_books/core/widgets/download/custom_snack_bar_for_download.dart';
import 'package:scripto_books/core/widgets/download/perform_download.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

Future<void> downloadToDownloadsFolder(String url, String fileName) async {
  // Request manage external storage permission for Android 10+
  if (Platform.isAndroid) {
    if (await Permission.manageExternalStorage.request().isGranted) {
      await performDownload(url, fileName);
    } else if (await Permission.storage.request().isGranted) {
      await performDownload(url, fileName);
    } else {
      customShowSnackBar(text: 'Permission denied', duration: 2);
    }
  } else {
    // For iOS, use documents directory
    await performDownload(url, fileName);
  }
}
