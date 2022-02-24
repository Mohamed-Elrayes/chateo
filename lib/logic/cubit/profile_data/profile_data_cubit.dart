import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chateo/core/constants/api_constant.dart';
import 'package:chateo/core/constants/pick_and_save_image.dart';
import 'package:chateo/data/models/user_model.dart';
import 'package:chateo/data/repositories/firebase_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  FireMethodRepo fireMethodRepo;
  ProfileDataCubit()
      : fireMethodRepo = FireMethodRepo(),
        super(const ProfileDataState());
  UserModel profileDataCached = UserModel();

  Future<void> saveProfileData() async {
    try {
      emit(state.copyWith(profileDataStatus: ProfileDataStatus.loading));

      // // ToDO: upload object to firebase [_uploadProfileObject]
      await _uploadProfileObjectToFIrebase(
          File(profileDataCached.profileImage!));
      // // ToDO: save object local to firebase [_saveProfileObject]
      await _saveProfileObject();
      emit(state.copyWith(profileDataStatus: ProfileDataStatus.success));
    } on FirebaseException catch (e) {
      emit(state.copyWith(
          profileDataStatus: ProfileDataStatus.failed,
          errorMessage: e.message));
    }
  }

  Future<void> _saveProfileObject() async {
    final _shared = await SharedPreferences.getInstance();
    final String _encodedMap = json.encode(profileDataCached.toMap());
    _shared.setString(profileObjectData, _encodedMap);
  }

  Future<void> _uploadProfileObjectToFIrebase(File imageProfile) async {
    // // ToDO: upload Image to firebase [ _uploadImageToFireStorage()]
    await _uploadImageToFireStorage(imageProfile);
    profileDataCached.timeStamp = FieldValue.serverTimestamp().toString();
    final CollectionReference users =
        FirebaseFirestore.instance.collection(rootUsersCollection);

    await users.add(profileDataCached.toMap());
  }

  Future<void> _uploadImageToFireStorage(File imageProfile) async {
    final urlImage =
        await fireMethodRepo.uploadFile(imageToUpload: imageProfile);
    profileDataCached.imageUrlServer = urlImage;
  }
}
