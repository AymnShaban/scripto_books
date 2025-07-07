import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission(BuildContext context) async {
  // Request storage permission
  var status = await Permission.storage.request();

  if (status.isGranted) {
    return true;
  } else if (status.isDenied) {
    // Show explanation dialog and request again
    bool tryAgain = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          AlertDialog(
            title: const Text("Permission Required"),
            content: const Text(
              "We need storage permission to download files. "
                  "Please grant the permission to continue.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => openAppSettings(),
                child: const Text("Try it"),
              ),
            ],
          ),
    );

    if (tryAgain == true) {
      // Request permission again after dialog
      return await requestStoragePermission(context);
    }
    return false;
  } else if (status.isPermanentlyDenied) {
    // Open app settings if permanently denied
    await openAppSettings();
    return false;
  }
  return false;
}

