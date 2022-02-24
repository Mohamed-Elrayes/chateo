part of 'image_profile_cubit.dart';

enum ImageStatus { saved, unFound, loading }

class ImageProfileState extends Equatable {
  const ImageProfileState({
    this.imageFile,
    this.imageStatus = ImageStatus.unFound,
  });
  final File? imageFile;
  final ImageStatus imageStatus;
  @override
  List<Object?> get props => [imageFile, imageStatus];

  ImageProfileState copyWith({
    File? imageFile,
    ImageStatus? imageStatus,
  }) {
    return ImageProfileState(
      imageFile: imageFile ?? this.imageFile,
      imageStatus: imageStatus ?? this.imageStatus,
    );
  }
}
