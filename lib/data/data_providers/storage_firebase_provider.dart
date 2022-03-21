import 'dart:io';

import 'package:chateo/core/constants/api_constant.dart';
import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:chateo/data/interface/i_storage_firebase.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class StorageFirebaseProvider implements IStorageFirebase {
  FirebaseStorage firebase;
  StorageFirebaseProvider() : firebase = FirebaseStorage.instance;

  @override
  Future<String> uploadFile({required File imageToUpload}) async {
    // try {
      final title = basename(imageToUpload.path);
      final ref =
          firebase.ref().child(namePathFileOnFirebaseStorage).child(title);
      await ref.putFile(imageToUpload);

      return await firebase
          .ref()
          .child(namePathFileOnFirebaseStorage)
          .child(title)
          .getDownloadURL();
    // } on FirebaseException catch (e) {
    //   e.logI();
    //   rethrow;
    // }
  }
}
