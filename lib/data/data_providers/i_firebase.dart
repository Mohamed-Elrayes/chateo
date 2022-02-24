import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class ICloudFireStore {
  UploadTask? uploadFile({required String title, required File imageToUpload});

}