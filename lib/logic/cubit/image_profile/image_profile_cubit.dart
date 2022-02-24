import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chateo/core/constants/pick_and_save_image.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';


part 'image_profile_state.dart';

class ImageProfileCubit extends Cubit<ImageProfileState> {
  ImageProfileCubit() : super(const ImageProfileState());

  Future<void> onTapToPicImage() async {
    try {
      emit(state.copyWith(imageStatus: ImageStatus.loading));
      // // ToDO: pick image from device [ _pickImage()]
      final PlatformFile? _platformFile = await _pickImage();

      if (_platformFile == null) {
        emit(state.copyWith(imageStatus: ImageStatus.unFound));
      }
      final imageFile = await _saveImageToStorage(_platformFile!);
      emit(
        state.copyWith(imageFile: imageFile, imageStatus: ImageStatus.saved),
      );

      emit(state.copyWith(imageStatus: ImageStatus.saved));
    } catch (e) {
      emit(state.copyWith(imageStatus: ImageStatus.unFound));
      rethrow;
    }
  }

  Future<PlatformFile?> _pickImage() async {
    final FilePickerResult? fileResult = await DeviceResources.pickFileImage();
    return fileResult?.files.first;
  }

  Future<File> _saveImageToStorage(PlatformFile platformFile) async {
    return DeviceResources.saveFileToDocumentsDirectory(platformFile);
  }
}
