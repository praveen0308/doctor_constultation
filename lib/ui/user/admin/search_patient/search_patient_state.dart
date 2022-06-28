part of 'search_patient_cubit.dart';

@immutable
abstract class SearchPatientState {}

class SearchPatientInitial extends SearchPatientState {}

class Loading extends SearchPatientState {}

class ReceivedPatients extends SearchPatientState {
  final List<PatientDetailModel> patients;

  ReceivedPatients(this.patients);
}

class Error extends SearchPatientState {
  final String msg;

  Error(this.msg);
}

