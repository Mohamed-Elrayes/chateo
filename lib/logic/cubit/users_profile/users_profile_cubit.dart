import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chateo/core/constants/api_constant.dart';
import 'package:chateo/core/constants/logger_devtool.dart';
import 'package:chateo/core/injector/inject.dart';
import 'package:chateo/data/models/user_model.dart';
import 'package:chateo/data/repositories/firebase_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'users_profile_state.dart';

class UsersProfileCubit extends Cubit<ProfileState> {
  final fireMethodRepo = injector<FireMethodRepo>();

  UsersProfileCubit() : super(const ProfileState());
  Future getAllProfile() async {
    try {
      await fireMethodRepo
          .accessToCollection(rootUsersCollection)
          .snapshots()
          .listen((event) {
        final data = event.docs
            .map(
              (DocumentSnapshot document) => UserModel.fromMap(
                document.data()! as Map<String, dynamic>,
              ),
            )
            .toList();
        emit(state.copyWith(usersProfile: data));
        "message".logWtf();
      });
    } on FirebaseException catch (e) {
      e.message!.logE();
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
