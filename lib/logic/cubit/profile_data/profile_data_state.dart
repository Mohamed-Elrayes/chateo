part of 'profile_data_cubit.dart';

enum ProfileDataStatus { success, failed, unSend  , loading}

class ProfileDataState extends Equatable {
  const ProfileDataState({
    this.profileDataStatus = ProfileDataStatus.unSend,
     this.errorMessage,
  });
  final ProfileDataStatus profileDataStatus;
  final String? errorMessage;
  @override
  List<Object> get props => [profileDataStatus];

  ProfileDataState copyWith({
    ProfileDataStatus? profileDataStatus,
    String? errorMessage,
  }) {
    return ProfileDataState(
      profileDataStatus: profileDataStatus ?? this.profileDataStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
