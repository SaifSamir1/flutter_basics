import 'package:flutter_basics_app/features/auth/cubit/auth_states.dart';
import 'package:flutter_basics_app/features/auth/data/models/user_model.dart';
import 'package:flutter_basics_app/features/auth/data/repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AuthCubit(this.authRepo) : super(AuthInitialState());

  Future<void> signUp({
    required UserModel userModel,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    final result = await authRepo.signUp(
      userModel: userModel,
      password: password,
    );

    result.fold(
      (error) {
        emit(SignUpErrorState(error));
      },
      (userModel) {
        emit(SignUpSuccessState(userModel));
      },
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final result = await authRepo.login(
      email: email,
      password: password,
    );

    result.fold(
      (error) {
        emit(LoginErrorState(error));
      },
      (userModel) {
        emit(LoginSuccessState(userModel));
      },
    );
  }

  Future<void> logout() async {
    emit(LogoutLoadingState());
    final result = await authRepo.logout();
    result.fold(
      (error) {
        emit(LogoutErrorState(error));
      },
      (_) {
        emit(LogoutSuccessState());
      },
    );
  }
}
