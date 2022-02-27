part of 'add_patient_cubit.dart';

@immutable
abstract class AddPatientState {}

class AddPatientInitial extends AddPatientState {}

class Loading extends AddPatientState {}

class Error extends AddPatientState {
  final String msg;
  Error(this.msg);
}

class PatientAddedSuccessfully extends AddPatientState {}

// class AddressAddedSuccessfully extends AddPatientState {}
