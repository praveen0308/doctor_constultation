part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class Loading extends RegisterState {}

class UserAlreadyExist extends RegisterState {}

class Error extends RegisterState {
  final String msg;

  Error(this.msg);
}

class RegistrationSuccessful extends RegisterState {}
