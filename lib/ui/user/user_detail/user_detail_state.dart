part of 'user_detail_cubit.dart';

@immutable
abstract class UserDetailState {}

class UserDetailInitial extends UserDetailState {}

class Loading extends UserDetailState {}

class LoadingPatients extends UserDetailState {}

class Error extends UserDetailState {
  final String msg;

  Error(this.msg);
}

class ReceivedPatientRecords extends UserDetailState {
  final List<PatientDetailModel> patients;

  ReceivedPatientRecords(this.patients);
}

class ReceivedUserDetails extends UserDetailState {
  final UserModel userModel;

  ReceivedUserDetails(this.userModel);
}
