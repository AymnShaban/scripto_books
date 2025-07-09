import 'package:flutter/material.dart';

import 'direct_download.dart';

void customShowSnackBar({required String text, required int duration}) {
  scaffoldMessengerKey.currentState
    ?..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(text), duration: Duration(seconds: duration)),
    );
}