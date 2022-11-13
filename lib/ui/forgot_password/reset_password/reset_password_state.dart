part of 'reset_password_cubit.dart';

@immutable
abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class Loading extends ResetPasswordState {}
class Error extends ResetPasswordState {
  final String msg;

  Error(this.msg);

}

class ResetPasswordSuccessful extends ResetPasswordState {}
class ResetPasswordFailed extends ResetPasswordState {}
