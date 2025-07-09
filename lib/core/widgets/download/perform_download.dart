
import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import 'custom_snack_bar_for_download.dart';
import 'on_receive_progress.dart';

Future<void> performDownload(String url, String fileName) async {
  try {
    String? downloadsPath;

    if (Platform.isAndroid) {
      downloadsPath = await AndroidPathProvider.downloadsPath;
    } else if (Platform.isIOS) {
      final dir = await getApplicationDocumentsDirectory();
      downloadsPath = dir.path;
    }

    if (downloadsPath == null) throw Exception('Could not get downloads path');

    final savePath = '$downloadsPath/$fileName';
    final dio = Dio();

    customShowSnackBar(text: 'Starting download...', duration: 2);
    await dio.download(url, savePath, onReceiveProgress: onReceiveProgress);
    // Make file visible in gallery/downloads
    if (Platform.isAndroid) {
      await File(savePath).create(recursive: true);
    }
    customShowSnackBar(
      duration: 4,
      text: 'Download complete in Downloads folder',
    );
  } catch (e) {
    customShowSnackBar(text: 'Download failed: ${e.toString()}', duration: 1);
  }
}