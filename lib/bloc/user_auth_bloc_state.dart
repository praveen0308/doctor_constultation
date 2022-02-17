part of 'user_auth_bloc_cubit.dart';

@immutable
abstract class UserAuthBlocState {}

class UserAuthBlocInitial extends UserAuthBlocState {}

class UserAuthBlocLoading extends UserAuthBlocState {}

class UserAuthBlocRegistrationDone extends UserAuthBlocState {}

class UserAuthBlocRegistrationFailed extends UserAuthBlocState {}

class Error extends UserAuthBlocState {}
