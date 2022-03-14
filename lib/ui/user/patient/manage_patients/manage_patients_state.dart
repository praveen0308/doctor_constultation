part of 'manage_patients_cubit.dart';

@immutable
abstract class ManagePatientsState {}

class ManagePatientsInitial extends ManagePatientsState {}

class Loading extends ManagePatientsState {}

class ReceivedPatientList extends ManagePatientsState {
  final List<PatientDetailModel> patients;
  ReceivedPatientList(this.patients);
}

class Error extends ManagePatientsState {
  final String msg;

  Error(this.msg);
}
