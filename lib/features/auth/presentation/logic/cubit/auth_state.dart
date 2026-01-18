part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  loginLoading,
  loginSuccess,
  loginFailure,
  registerLoading,
  registerSuccess,
  registerFailure,
}

extension AuthStatusX on AuthStatus {
  bool get isLoading =>
      this == AuthStatus.loginLoading || this == AuthStatus.registerLoading;
  bool get isSuccess =>
      this == AuthStatus.loginSuccess || this == AuthStatus.registerSuccess;
  bool get isFailure =>
      this == AuthStatus.loginFailure || this == AuthStatus.registerFailure;
}

class AuthState extends Equatable {
  final AuthStatus status;
  final UserModel? userModel;
  final AppFailure? failure;

  const AuthState({required this.status, this.userModel, this.failure});

  AuthState copyWith({
    AuthStatus? status,
    UserModel? userModel,
    AppFailure? failure,
  }) {
    return AuthState(
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [status, userModel, failure];
}
