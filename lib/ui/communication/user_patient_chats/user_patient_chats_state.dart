part of 'user_patient_chats_cubit.dart';

@immutable
abstract class UserPatientChatsState {}

class UserPatientChatsInitial extends UserPatientChatsState {}

class LoadingPatients extends UserPatientChatsState {}

class Error extends UserPatientChatsState {
  final String msg;

  Error(this.msg);
}

class ReceivedPatientRecords extends UserPatientChatsState {
  final List<PatientDetailModel> patients;

  ReceivedPatientRecords(this.patients);
}
