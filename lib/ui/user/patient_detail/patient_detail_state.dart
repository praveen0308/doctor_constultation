part of 'patient_detail_cubit.dart';

@immutable
abstract class PatientDetailState {}

class PatientDetailInitial extends PatientDetailState {}

class Loading extends PatientDetailState {}

class LoadingAppointmentHistory extends PatientDetailState {}

class Error extends PatientDetailState {
  final String msg;

  Error(this.msg);
}

class ReceivedAppointmentHistory extends PatientDetailState {
  final List<AppointmentDetailModel> appointments;

  ReceivedAppointmentHistory(this.appointments);
}

class ReceivedPatientDetails extends PatientDetailState {
  final PatientDetailModel patientDetailModel;

  ReceivedPatientDetails(this.patientDetailModel);
}
