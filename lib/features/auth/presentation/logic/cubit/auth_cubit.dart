import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iot_test_app/core/error/error.dart';
import 'package:iot_test_app/features/auth/data/models/user_model.dart';
import 'package:iot_test_app/features/auth/data/repo/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository)
    : super(const AuthState(status: AuthStatus.initial));
  final AuthRepository authRepository;

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(status: AuthStatus.loginLoading));
    final result = await authRepository.login(email: email, password: password);

    result.fold(
      (l) => emit(state.copyWith(failure: l, status: AuthStatus.loginFailure)),
      (r) =>
          emit(state.copyWith(userModel: r, status: AuthStatus.loginSuccess)),
    );
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(status: AuthStatus.registerLoading));
    final result = await authRepository.register(
      name: name,
      email: email,
      password: password,
    );

    result.fold(
      (l) =>
          emit(state.copyWith(failure: l, status: AuthStatus.registerFailure)),
      (r) => emit(
        state.copyWith(userModel: r, status: AuthStatus.registerSuccess),
      ),
    );
  }
}
