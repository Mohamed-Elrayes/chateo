import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthFirebase {
  Future<bool> isLoggedIn();
  Future sendOtp({
    required String phoneNumber,
    required Duration timeout,
    required void Function(PhoneAuthCredential) verificationCompleted,
    required void Function(FirebaseAuthException) verificationFailed,
    required void Function(String, int?) codeSent,
    required void Function(String) codeAutoRetrievalTimeout,
  });
  Future<User?> verifyPhoneNumber({required String verificationId,required String smsCode});
}
