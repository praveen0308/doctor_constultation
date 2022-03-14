part of 'patient_detail_cubit.dart';

@immutable
abstract class PatientDetailState {}

class PatientDetailInitial extends PatientDetailState {}

class Loading extends PatientDetailState {}

class ReceivedAppointmentDetails extends PatientDetailState {
  final List<AppointmentDetailModel> appointments;

  ReceivedAppointmentDetails(this.appointments);
}

class Error extends PatientDetailState {
  final String msg;

  Error(this.msg);
}
