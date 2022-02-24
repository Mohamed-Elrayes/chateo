import 'dart:io';

import '../data_providers/firebase_provider.dart';
import '../data_providers/i_firebase.dart';

class FireMethodRepo implements FirebaseMethod {
  final FirebaseProvider _firebaseProvider;
  FireMethodRepo() : _firebaseProvider = FirebaseProvider();

  @override
  Future<String> uploadFile({required File imageToUpload}) =>
      _firebaseProvider.uploadFile(imageToUpload: imageToUpload);

  //  =>
  //     _firebaseProvider.uploadFile(destination: destination, file: file);
}
