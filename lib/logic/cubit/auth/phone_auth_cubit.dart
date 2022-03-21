import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/core/constants/api_constant.dart';
import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:chateo/core/injector/inject.dart';
import 'package:chateo/data/error/exception_firebase_message.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../../../data/repositories/shared_preferences/shared_preferences_impl.dart';

part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  // final fireMethodRepo = injector<FireMethodRepo>();
  final instanceSharedPref = injector<SharedPreferencesImpl>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late String verifyId;
  late String phoneNumber;
  bool get loggedIn => _firebaseAuth.currentUser != null;
  PhoneAuthCubit() : super(const PhoneAuthState());

  FutureOr<void> sendOtp() async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      verificationCompleted: (_) {},
      verificationFailed: _verificationFailed,
      codeSent: _codeSent,
      codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
    );
    // await fireMethodRepo.sendOtp(
    //     phoneNumber: '+2$phoneNumber',
    //     timeout: const Duration(seconds: 60),
    //     verificationCompleted: _verificationCompleted,
    //     verificationFailed: _verificationFailed,
    //     codeSent: _codeSent,
    //     codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout);
  }

  FutureOr<void> submitOtp(String otpCode) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: otpCode,
      );
      await signIn(credential);
    } on FirebaseException catch (e) {
      final _error = FirException.fromCode(e.code);
      emit(
        state.copyWith(
          authStatus: AuthStatus.failed,
          errorMessage: _error.message,
        ),
      );
    }
    emit(state.copyWith(authStatus: AuthStatus.initial));
  }
  //++++++++++++++++++++++++++++++++++++++++++++++++++++

  FutureOr<void> signIn(PhoneAuthCredential credential) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    final UserCredential authResult =
        await _firebaseAuth.signInWithCredential(credential);
    final User? user = authResult.user;
    bool isNewUser = authResult.additionalUserInfo!.isNewUser;
    if (isNewUser) {
      if (user != null) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.signUp,
            userId: authResult.user?.uid,
          ),
        );
        await changeStateKeyVerifyScreen();
      }
    } else {
      emit(
        state.copyWith(
          authStatus: AuthStatus.login,
          userId: authResult.user?.uid,
        ),
      );
      await changeStateKeyVerifyScreen();
    }
  }

  Future<void> changeStateKeyVerifyScreen() async {
    await instanceSharedPref.setBoolData(SharedKey.showVerifyScreen, false);
  }
  // //++++++++++++++++++++++++++++++++++++++++++++++++++++

  // //++++++++++++++++++++++++++++++++++++++++++++++++++++
  // Future<void> _verificationCompleted(
  //     PhoneAuthCredential phoneAuthCredential) async {

  //   final UserCredential authResult =
  //       await _firebaseAuth.signInWithCredential(phoneAuthCredential);
  //   final User? user = authResult.user;

  //   if (authResult.additionalUserInfo!.isNewUser) {
  //     if (user != null) {
  //       user.uid.logWtf();
  //       emit(
  //         state.copyWith(
  //           authStatus: AuthStatus.otpVerified,
  //           userId: user.uid,
  //         ),
  //       );
  //     }
  //   } else {
  //     user?.uid.logI();
  //     emit(
  //       state.copyWith(
  //         authStatus: AuthStatus.login,
  //         userId: user?.uid,
  //       ),
  //     );
  //   }
  //   emit(state.copyWith(authStatus: AuthStatus.initial));

  //   // User user = firebase.currentUser!;
  //   // if (phoneAuthCredential.smsCode != null) {
  //   //   try {
  //   //     await user.linkWithCredential(phoneAuthCredential);
  //   //   } on FirebaseAuthException catch (e) {
  //   //     if (e.code == 'provider-already-linked') {
  //   //       emit(
  //   //         state.copyWith(
  //   //           authStatus: AuthStatus.otpVerified,
  //   //           userId: user.uid,
  //   //           kindUser: KindUser.newUser,
  //   //         ),
  //   //       );
  //   //     }
  //   //   }
  //   // } else {
  //   //   await firebase.signInWithCredential(phoneAuthCredential);
  //   // }
  // }
  // //++++++++++++++++++++++++++++++++++++++++++++++++++++

// Checked ✔:
  void _verificationFailed(FirebaseAuthException error) {
    error.logWtf();
    emit(
      state.copyWith(
        authStatus: AuthStatus.failed,
        errorMessage: FirException.fromCode(error.code).message,
      ),
    );
  }

  void _codeSent(String verificationId, int? forceResendingToken) {
    verifyId = verificationId;
    // PhoneAuthCredential credential = PhoneAuthProvider.credential(
    //     verificationId: verificationId, smsCode: smsCode);
    emit(
      state.copyWith(
        authStatus: AuthStatus.completeSend,
      ),
    );
  }

  void _codeAutoRetrievalTimeout(String verificationId) {
    //TODO: call ResendCode
  }

  Future<void> signOut() async => await _firebaseAuth.signOut();
}
