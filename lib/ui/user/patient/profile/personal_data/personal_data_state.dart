part of 'personal_data_cubit.dart';

@immutable
abstract class PersonalDataState {}

class PersonalDataInitial extends PersonalDataState {}

class Loading extends PersonalDataState {}

class Updating extends PersonalDataState {}

class UpdatedSuccessfully extends PersonalDataState {}

class Error extends PersonalDataState {
  final String msg;

  Error(this.msg);
}

class ReceivedUserDetails extends PersonalDataState {
  final UserModel userModel;

  ReceivedUserDetails(this.userModel);
}
