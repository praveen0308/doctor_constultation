part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class IncorrectCredential extends LoginState {}

class Error extends LoginState {
  final String msg;

  Error(this.msg);
}

class LoginSuccessful extends LoginState {
  final UserModel userModel;

  LoginSuccessful(this.userModel);
}