part of 'enter_user_detail_cubit.dart';

abstract class EnterUserDetailState {}

class EnterUserDetailInitial extends EnterUserDetailState {}

class Loading extends EnterUserDetailState {}

class Success extends EnterUserDetailState {
  final int roleId;

  Success(this.roleId);
}

class Failed extends EnterUserDetailState {}

class Error extends EnterUserDetailState {
  final String msg;
  Error(this.msg);
}
