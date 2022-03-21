part of 'phone_auth_cubit.dart';

enum AuthStatus {
  loading,
  failed,
  completeSend,
  signUp,
  login,
  initial
}


@immutable
class PhoneAuthState extends Equatable {
  final AuthStatus authStatus;
  final String? errorMessage;
  final String ? userId;
  const PhoneAuthState({
    this.authStatus = AuthStatus.initial,
    this.userId,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [authStatus , userId ];

  PhoneAuthState copyWith({
    AuthStatus? authStatus,
    String? errorMessage,
    String ? userId,
  }) {
    return PhoneAuthState(
      authStatus: authStatus ?? this.authStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      userId: userId ?? this.userId,
    );
  }
}
