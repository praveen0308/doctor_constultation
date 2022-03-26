part of 'search_user_cubit.dart';

@immutable
abstract class SearchUserState {}

class SearchUserInitial extends SearchUserState {}

class Loading extends SearchUserState {}

class ReceivedUsers extends SearchUserState {
  final List<UserModel> users;

  ReceivedUsers(this.users);
}

class Error extends SearchUserState {
  final String msg;

  Error(this.msg);
}
