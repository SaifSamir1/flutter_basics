

import 'package:flutter_basics_app/features/auth/data/models/user_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class SignUpLoadingState extends AuthState {}
class SignUpSuccessState extends AuthState {
  final UserModel userModel;
  SignUpSuccessState(this.userModel);
}
class SignUpErrorState extends AuthState {
  final String error;
  SignUpErrorState(this.error);
}


class LoginLoadingState extends AuthState {}
class LoginSuccessState extends AuthState {
  final UserModel userModel;
  LoginSuccessState(this.userModel);
}
class LoginErrorState extends AuthState {
  final String error;
  LoginErrorState(this.error);
}


class LogoutLoadingState extends AuthState {}
class LogoutSuccessState extends AuthState {}
class LogoutErrorState extends AuthState {
  final String error;
  LogoutErrorState(this.error);
}