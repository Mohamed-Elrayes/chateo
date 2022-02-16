import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import '../../../core/constants/method_const.dart';

part 'image_profile_data_state.dart';

class ImageProfileDataCubit extends Cubit<ImageProfileDataState> {
  ImageProfileDataCubit() : super(const ImageProfileDataState());

  void onTapToPicImage() async {
    FilePickerResult? fileResult = await pickFileImage();
    emit(state.copyWith(imageStatus: ImageStatus.loading));
    PlatformFile? _platformFile = fileResult?.files.first;
    _fileSaved(_platformFile);
  }

  void _fileSaved(PlatformFile? _platformFile) async {
    if (_platformFile != null) {
      final fileSaved = await saveFileToDocumentsDirectory(_platformFile);
      emit(
        state.copyWith(
            imageFile: fileSaved,
            isSetImage: true,
            imageStatus: ImageStatus.found),
      );
    } else {
      emit(state.copyWith(imageStatus: ImageStatus.unFound, isSetImage: true));
    }
  }
}
