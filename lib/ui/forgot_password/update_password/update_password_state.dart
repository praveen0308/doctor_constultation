part of 'update_password_cubit.dart';

@immutable
abstract class UpdatePasswordState {}

class UpdatePasswordInitial extends UpdatePasswordState {}

class Loading extends UpdatePasswordState {}
class Error extends UpdatePasswordState {
  final String msg;
  Error(this.msg);
}

class UpdatePasswordSuccessful extends UpdatePasswordState {}
class UpdatePasswordFailed extends UpdatePasswordState {}


