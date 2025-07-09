import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermissions() async {
  // Request storage permission
  var storageStatus = await Permission.storage.request();
  if (storageStatus.isGranted) {
    // Storage permission granted
    print("Storage permission granted");
  } else {
    // Storage permission denied
    print("Storage permission denied");
  }

  // Request camera permission
  var cameraStatus = await Permission.camera.request();
  if (cameraStatus.isGranted) {
    // Camera permission granted
    print("Camera permission granted");
  } else {
    // Camera permission denied
    print("Camera permission denied");
  }
}

Future<void> checkPermissions() async {
  var storageStatus = await Permission.storage.status;
  var cameraStatus = await Permission.camera.status;

  if (storageStatus.isGranted) {
    print("Storage permission is already granted");
  }
  if (cameraStatus.isGranted) {
    print("Camera permission is already granted");
  }
}