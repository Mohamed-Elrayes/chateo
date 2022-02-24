import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chateo/core/constants/api_constant.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/method_const.dart';
import '../../../data/repositories/firebase_repo.dart';
import '../../../core/constants/pick_and_save_image.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ImageProfileDataState> {
  ProfileDataCubit() : super(const ImageProfileDataState());
  Map<String, String> profileData = {};
   
  
}

// class ImageProfileDataCubit extends Cubit<ImageProfileDataState> {
//   // FireMethodRepo fireMethodRepo;
//   // ImageProfileDataCubit(this.fireMethodRepo)
//   //     :  super(const ImageProfileDataState());

//   // void onTapToPicImage() async {
//   //   FilePickerResult? fileResult = await PickAndSaveImageRepo.pickFileImage();
//   //   emit(state.copyWith(imageStatus: ImageStatus.loading));
//   //   PlatformFile? _platformFile = fileResult?.files.first;
//   //   _fileSaved(_platformFile);
//   // }

//   // void _fileSaved(PlatformFile? _platformFile) {
//   //   if (_platformFile != null) {
//   //     _kindSourceImage(_platformFile);
//   //   } else {
//   //     emit(state.copyWith(
//   //       imageStatus: ImageStatus.unFound,
//   //     ));
//   //   }
//   // }

//   // Future<String?> getFromLocalSaved() async {
//   //   final prefs = await SharedPreferences.getInstance();
//   //   return prefs.getString(photoPath);
//   // }

//   // UploadTask? saveOnFireStor(destination, File fileSaved) {
//   //   return fireMethodRepo.uploadFile(destination: destination, file: fileSaved);
//   // }

//   // void _kindSourceImage(_platformFile) async {
//   // await  getFromLocalSaved();

//   //   if (_path == null) {
//   //     final fileSaved = await PickAndSaveImageRepo.saveFileToDocumentsDirectory(_platformFile);
//   //     String nameFile = basename(fileSaved.path);
//   //     //  destination: '$namePathOnStorage/$nameFile', file: fileSaved);
//   //     emit(state.copyWith(
//   //         imageFile: fileSaved,
//   //         imageStatus: ImageStatus.found));
//   //   } else {
//   //     logger.wtf('message');
//   //     emit(
//   //       state.copyWith(
//   //           imageFile: File(_path),
//   //           imageStatus: ImageStatus.found),
//   //     );
//   //   }
//   // }
// }
