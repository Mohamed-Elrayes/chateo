import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chateo/core/constants/api_constant.dart';
import 'package:chateo/core/injector/inject.dart';
import 'package:chateo/data/models/user_model.dart';
import 'package:chateo/data/repositories/firebase_repo.dart';
import 'package:chateo/data/repositories/shared_pref_repo.dart';
import 'package:chateo/data/repositories/shared_preferences/shared_preferences_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
   final fireMethodRepo = injector<FireMethodRepo>();
   final sharedPrefRepo = injector<SharedPreferencesImpl>();
  ProfileDataCubit(): super(const ProfileDataState());
  UserModel profileDataCached = UserModel();

  Future<void> saveProfileData() async {
    try {
      emit(state.copyWith(profileDataStatus: ProfileDataStatus.loading));

      // // ToDO: upload object to firebase [_uploadProfileObject]
      await _uploadProfileObjectToFIrebase(
        File(profileDataCached.profileImage!),
      );
      // // ToDO: save object local to firebase [_saveProfileObject]
      await _saveProfileObject();
      emit(state.copyWith(profileDataStatus: ProfileDataStatus.success));
    } on FirebaseException catch (e) {
      emit(
        state.copyWith(
          profileDataStatus: ProfileDataStatus.failed,
          errorMessage: e.message,
        ),
      );
    }
  }

  Future<void> _saveProfileObject() async {
    final String _encodedMap = json.encode(profileDataCached.toMap());
    await sharedPrefRepo.setStringData(profileObjectData, _encodedMap);
  }

  Future<void> _uploadProfileObjectToFIrebase(File imageProfile) async {
    // // ToDO: upload Image to firebase [ _uploadImageToFireStorage()]
    await _uploadImageToFireStorage(imageProfile);
    profileDataCached.timeStamp = FieldValue.serverTimestamp().toString();
    
    final CollectionReference users =
       fireMethodRepo.accessToCollection(rootUsersCollection);

    await users.add(profileDataCached.toMap());
  }

  Future<void> _uploadImageToFireStorage(File imageProfile) async {
    final urlImage =
        await fireMethodRepo.uploadFile(imageToUpload: imageProfile);
    profileDataCached.imageUrlServer = urlImage;
  }
}
