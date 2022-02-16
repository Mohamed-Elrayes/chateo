part of 'image_profile_data_cubit.dart';

enum ImageStatus { found, unFound, loading  , initial}

class ImageProfileDataState extends Equatable {
  const ImageProfileDataState({
    this.imageFile,
    this.isSetImage = false,
    this.imageStatus = ImageStatus.initial,
  });
  final File? imageFile;
  final ImageStatus imageStatus;
  final bool isSetImage;
  @override
  List<Object?> get props => [imageFile, isSetImage, imageStatus];

  ImageProfileDataState copyWith({
    File? imageFile,
    ImageStatus? imageStatus,
    bool? isSetImage,
  }) {
    return ImageProfileDataState(
      imageFile: imageFile ?? this.imageFile,
      imageStatus: imageStatus ?? this.imageStatus,
      isSetImage: isSetImage ?? this.isSetImage,
    );
  }
}
