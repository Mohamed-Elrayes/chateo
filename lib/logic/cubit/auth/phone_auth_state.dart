part of 'phone_auth_cubit.dart';

enum AuthStatus {
  loading,
  failedOtp,
  failedVerify,
  success,
  otpVerified,
  initial
}
enum KindUser{oldUser ,newUser }

@immutable
class PhoneAuthState extends Equatable {
  final AuthStatus authStatus;
  final KindUser kindUser;
  final String? errorMessage;
  final String ? userId;
  const PhoneAuthState({
    this.authStatus = AuthStatus.initial,
    this.kindUser = KindUser.newUser,
    this.userId,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [authStatus , userId,kindUser];

  PhoneAuthState copyWith({
    AuthStatus? authStatus,
    KindUser? kindUser,
    String? errorMessage,
    String ? userId,
  }) {
    return PhoneAuthState(
      authStatus: authStatus ?? this.authStatus,
      kindUser: kindUser ?? this.kindUser,
      errorMessage: errorMessage ?? this.errorMessage,
      userId: userId ?? this.userId,
    );
  }
}
