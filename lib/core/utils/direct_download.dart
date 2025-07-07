import 'dart:io';

import 'package:android_path_provider/android_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
//
// Future<void> downloadFile(String url, String fileName) async {
//   try {
//     scaffoldMessengerKey.currentState?.showSnackBar(
//       SnackBar(
//         content: Text('Preparing download...'),
//         duration: Duration(days: 1), // Very long duration
//       ),
//     );
//     // Request storage permission
//     if (await Permission.storage.request().isGranted) {
//       final dio = Dio();
//       final dir = await getApplicationDocumentsDirectory();
//       final path = '${dir.path}/$fileName';
//
//       await dio.download(
//         url,
//         path,
//         onReceiveProgress: (received, total) {
//           if (total != -1) {
//             // Update existing SnackBar
//             scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
//             scaffoldMessengerKey.currentState?.showSnackBar(
//               SnackBar(
//                 content: Text(
//                   'Downloading: ${(received / total * 100).toStringAsFixed(0)}%',
//                 ),
//                 duration: Duration(days: 1),
//               ),
//             );
//           }
//         },
//       );
//       scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
//       scaffoldMessengerKey.currentState?.showSnackBar(
//         SnackBar(
//           content: Text('Download complete: $fileName'),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     } else {
//       scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
//       scaffoldMessengerKey.currentState?.showSnackBar(
//         SnackBar(
//           content: Text('Permission denied'),
//           duration: Duration(seconds: 1),
//         ),
//       );
//     }
//   } catch (e) {
//     scaffoldMessengerKey.currentState?.hideCurrentSnackBar();
//     scaffoldMessengerKey.currentState?.showSnackBar(
//       SnackBar(
//         content: Text('Download failed: ${e.toString()}'),
//         duration: Duration(seconds: 3),
//       ),
//     );
//   }
// }

Future<void> downloadToDownloadsFolder(String url, String fileName) async {
  // Request manage external storage permission for Android 10+
  if (Platform.isAndroid) {
    if (await Permission.manageExternalStorage.request().isGranted) {
      await _performDownload(url, fileName);
    } else if (await Permission.storage.request().isGranted) {
      await _performDownload(url, fileName);
    } else {
      scaffoldMessengerKey.currentState?.showSnackBar(
        SnackBar(content: Text('Permission denied')),
      );
    }
  } else {
    // For iOS, use documents directory
    await _performDownload(url, fileName);
  }
}

Future<void> _performDownload(String url, String fileName) async {
  try {
    String? downloadsPath;

    if (Platform.isAndroid) {
      // Get Android downloads directory
      downloadsPath = await AndroidPathProvider.downloadsPath;
    } else if (Platform.isIOS) {
      // For iOS, use documents directory
      final dir = await getApplicationDocumentsDirectory();
      downloadsPath = dir.path;
    }

    if (downloadsPath == null) throw Exception('Could not get downloads path');

    final savePath = '$downloadsPath/$fileName';
    final dio = Dio();

    scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text('Starting download...'),
        duration: Duration(milliseconds: 100),
      ),
    );

    await dio.download(
      url,
      savePath,
      onReceiveProgress: (received, total) {
        if (total != -1) {
          final progress = (received / total * 100).toStringAsFixed(0);
          scaffoldMessengerKey.currentState
            ?..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Downloading: $progress%'),
                duration: Duration(milliseconds: 100),
              ),
            );
        }
      },
    );

    // Make file visible in gallery/downloads
    if (Platform.isAndroid) {
      await File(savePath).create(recursive: true);
    }

    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Download complete in Downloads folder'),
          duration: Duration(seconds: 1),
        ),
      );
  } catch (e) {
    scaffoldMessengerKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Download failed: ${e.toString()}'),
          duration: Duration(seconds: 1),
        ),
      );
  }
}
