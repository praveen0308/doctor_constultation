part of 'manage_users_cubit.dart';

@immutable
abstract class ManageUsersState {}

class ManageUsersInitial extends ManageUsersState {}

class Loading extends ManageUsersState {}

class Error extends ManageUsersState {
  final String msg;

  Error(this.msg);
}

class ReceivedUsers extends ManageUsersState {
  final List<UserModel> users;

  ReceivedUsers(this.users);
}
