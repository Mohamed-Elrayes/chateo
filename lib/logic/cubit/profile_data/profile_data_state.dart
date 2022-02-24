part of 'profile_data_cubit.dart';

enum ImageStatus { found, unFound, loading  , initial}
enum ImageSource { local, online , notFound}

class ImageProfileDataState extends Equatable {
  const ImageProfileDataState({
    this.imageFile,
    this.imageStatus = ImageStatus.initial,
    this.imageSource = ImageSource.notFound,
  });
  final File? imageFile;
  final ImageStatus imageStatus;
  final ImageSource imageSource;
  @override
  List<Object?> get props => [imageFile, imageStatus , imageSource];

  ImageProfileDataState copyWith({
    File? imageFile,
    ImageStatus? imageStatus,
    ImageSource? imageSource,
  }) {
    return ImageProfileDataState(
      imageFile: imageFile ?? this.imageFile,
      imageStatus: imageStatus ?? this.imageStatus,
      imageSource: imageSource ?? this.imageSource,
    );
  }
}
