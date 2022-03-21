

part of 'users_profile_cubit.dart';

enum ProfileStatus { success, failed, initial }

class ProfileState extends Equatable {
  final List<UserModel> usersProfile;
  final ProfileStatus messageStatus;
  const ProfileState({
    this.usersProfile = const[],
    this.messageStatus = ProfileStatus.initial,
  });
  @override
  List<Object> get props => [usersProfile, messageStatus];


  ProfileState copyWith({
    List<UserModel>? usersProfile,
    ProfileStatus? messageStatus,
  }) {
    return ProfileState(
      usersProfile: usersProfile ?? this.usersProfile,
      messageStatus: messageStatus ?? this.messageStatus,
    );
  }
}
