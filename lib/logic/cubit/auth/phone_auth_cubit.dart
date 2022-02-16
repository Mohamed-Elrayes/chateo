import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  FirebaseAuth firebase = FirebaseAuth.instance;
  late String verifyId;
  PhoneAuthCubit() : super(const PhoneAuthState());

  FutureOr<void> submitPhoneNumber(String phoneNumber) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    await firebase.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 60),
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
    emit(state.copyWith(authStatus: AuthStatus.success));
  }

  void _verificationCompleted(PhoneAuthCredential phoneAuthCredential) async {
    await signIn(phoneAuthCredential);
  }

  void _verificationFailed(FirebaseAuthException error) {
    emit(state.copyWith(
        authStatus: AuthStatus.failed, errorMessage: error.toString()));
  }

  void _codeSent(String verificationId, int? forceResendingToken) {
    verifyId = verificationId;
    emit(state.copyWith(authStatus: AuthStatus.success));
  }

  void _codeAutoRetrievalTimeout(String verificationId) {}

  FutureOr<void> submitOtp(String otpCode) async {
    PhoneAuthCredential _credential = PhoneAuthProvider.credential(
        verificationId: verifyId, smsCode: otpCode);
    await signIn(_credential);
  }

  FutureOr<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(state.copyWith(
        authStatus: AuthStatus.otpVerified,
      ));
    } catch (e) {
      emit(state.copyWith(
          authStatus: AuthStatus.failed, errorMessage: e.toString()));
    }
  }

  FutureOr<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  User get getCurrentUser => FirebaseAuth.instance.currentUser!;
}
