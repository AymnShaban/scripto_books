import 'package:flutter/material.dart';

import 'direct_download.dart';

void onReceiveProgress(received, total) {
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
}
