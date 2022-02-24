import 'dart:io';

import 'package:chateo/data/data_providers/firebase_provider.dart';
import 'package:chateo/data/interface/i_firebase.dart';

class FireMethodRepo implements FirebaseMethod {
  final FirebaseProvider _firebaseProvider;
  FireMethodRepo() : _firebaseProvider = FirebaseProvider();

  @override
  Future<String> uploadFile({required File imageToUpload}) =>
      _firebaseProvider.uploadFile(imageToUpload: imageToUpload);
}
