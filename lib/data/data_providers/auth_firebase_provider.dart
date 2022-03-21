import 'package:chateo/data/interface/i_auth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase implements IAuthFirebase {
  FirebaseAuth firebase;
  AuthFirebase() : firebase = FirebaseAuth.instance;
  @override
  Future<void> sendOtp(
      {required String phoneNumber,
      required Duration timeout,
      required void Function(PhoneAuthCredential p1) verificationCompleted,
      required void Function(FirebaseAuthException p1) verificationFailed,
      required void Function(String p1, int? p2) codeSent,
      required void Function(String p1) codeAutoRetrievalTimeout}) {
    return firebase.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: timeout,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final firebaseUser = firebase.currentUser;
    return firebaseUser != null && firebaseUser.uid.isNotEmpty;
  }

 

  @override
  Future<User?> verifyPhoneNumber(
      {required String verificationId, required String smsCode}) {
    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    return firebase
        .signInWithCredential(credential)
        .then((value) => value.user);
  }
}
