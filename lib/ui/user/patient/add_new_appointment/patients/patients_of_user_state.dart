part of 'patients_of_user_cubit.dart';

@immutable
abstract class PatientsOfUserState {}

class PatientsOfUserInitial extends PatientsOfUserState {}

class Loading extends PatientsOfUserState {}

class Error extends PatientsOfUserState {
  final String msg;
  Error(this.msg);
}

class ReceivedPatientList extends PatientsOfUserState {
  final List<PatientDetailModel> patients;
  ReceivedPatientList(this.patients);
}
