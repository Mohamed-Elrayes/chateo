import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:chateo/data/error/exception_firebase_message.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  FirebaseAuth firebase = FirebaseAuth.instance;
  late String verifyId;
  late String phoneNumber;
  PhoneAuthCubit() : super(const PhoneAuthState());

  FutureOr<void> submitPhoneNumber() async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    await firebase.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 60),
      verificationCompleted: _verificationCompleted,
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
  }

  FutureOr<void> submitOtp(String otpCode) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    try {
      final PhoneAuthCredential _credential = PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: otpCode,
      );
      await signIn(_credential);
    } on FirebaseException catch (e) {
      final _error = FirException.fromCode(e.code);
      emit(
        state.copyWith(
          authStatus: AuthStatus.failedOtp,
          errorMessage: _error.message,
        ),
      );
    }
    emit(state.copyWith(authStatus: AuthStatus.initial));
  }

  FutureOr<void> signIn(PhoneAuthCredential credential) async {
    final UserCredential userData =
        await firebase.signInWithCredential(credential);
    final bool isNewUser = getCurrentUser.phoneNumber == phoneNumber;
    if (isNewUser) {
      emit(
        state.copyWith(
          authStatus: AuthStatus.otpVerified,
          userId: userData.user?.uid,
          kindUser: KindUser.oldUser,
        ),
      );
    }else{
        emit(
        state.copyWith(
          authStatus: AuthStatus.otpVerified,
          userId: userData.user?.uid,
        ),
      );
    }
  }

  FutureOr<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  User get getCurrentUser => FirebaseAuth.instance.currentUser!;

  void _verificationCompleted(PhoneAuthCredential phoneAuthCredential) {
    // await signIn(phoneAuthCredential);
    // User user = firebase.currentUser!;
    //         if (phoneAuthCredential.smsCode != null) {
    //           try {
    //             await user.linkWithCredential(phoneAuthCredential);
    //           } on FirebaseAuthException catch (e) {
    //             if (e.code == 'provider-already-linked') {
    //               await firebase.signInWithCredential(phoneAuthCredential);
    //             }
    //           }
    //         }
  }
  void _verificationFailed(FirebaseAuthException error) {
    error.logWtf();
    emit(
      state.copyWith(
        authStatus: AuthStatus.failedVerify,
        errorMessage: FirException.fromCode(error.code).message,
      ),
    );
  }

  void _codeSent(String verificationId, int? forceResendingToken) {
    verifyId = verificationId;
    emit(
      state.copyWith(
        authStatus: AuthStatus.success,
      ),
    );
  }

  void _codeAutoRetrievalTimeout(String verificationId) {}
}
