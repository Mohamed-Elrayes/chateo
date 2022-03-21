import 'dart:io';

import 'package:chateo/data/data_providers/auth_firebase_provider.dart';
import 'package:chateo/data/data_providers/cloud_firebase_provider.dart';
import 'package:chateo/data/data_providers/storage_firebase_provider.dart';
import 'package:chateo/data/interface/i_auth_firebase.dart';
import 'package:chateo/data/interface/i_cloud_firebase.dart';
import 'package:chateo/data/interface/i_storage_firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireMethodRepo
    with ICloudFirebase, IAuthFirebase
    implements IStorageFirebase {
  final StorageFirebaseProvider _firebaseProvider;
  final CloudFirebaseProvider _cloudFirProvider;
  final AuthFirebase _authFirebase;
  FireMethodRepo()
      : _firebaseProvider = StorageFirebaseProvider(),
        _cloudFirProvider = CloudFirebaseProvider(),
        _authFirebase = AuthFirebase();

  @override
  Future<String> uploadFile({required File imageToUpload}) =>
      _firebaseProvider.uploadFile(imageToUpload: imageToUpload);

  @override
  Stream<QuerySnapshot> receivedDataToFireStore({
    required String collectionPath,
    String? orderBy,
  }) =>
      _cloudFirProvider.receivedDataToFireStore(
          collectionPath: collectionPath, orderBy: orderBy);

  @override
  Future<DocumentReference<Map<String, dynamic>>> sendDataToFireStore(
    String collectionPath,
    Map<String, dynamic> data,
  ) =>
      _cloudFirProvider.sendDataToFireStore(collectionPath, data);

  @override
  CollectionReference<Object?> accessToCollection(String root) =>
      _cloudFirProvider.accessToCollection(root);

  @override
  Future<bool> isLoggedIn() => _authFirebase.isLoggedIn();

  @override
  Future sendOtp(
          {required String phoneNumber,
          required Duration timeout,
          required void Function(PhoneAuthCredential p1) verificationCompleted,
          required void Function(FirebaseAuthException p1) verificationFailed,
          required void Function(String p1, int? p2) codeSent,
          required void Function(String p1) codeAutoRetrievalTimeout}) =>
      _authFirebase.sendOtp(
          phoneNumber: phoneNumber,
          timeout: timeout,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);

  @override
  Future<User?> verifyPhoneNumber(
          {required String verificationId, required String smsCode}) =>
      _authFirebase.verifyPhoneNumber(
          verificationId: verificationId, smsCode: smsCode);
}
