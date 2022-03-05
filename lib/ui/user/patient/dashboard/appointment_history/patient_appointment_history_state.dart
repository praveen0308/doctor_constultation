part of 'patient_appointment_history_cubit.dart';

@immutable
abstract class PatientAppointmentHistoryState {}

class AppointmentHistoryInitial extends PatientAppointmentHistoryState {}

class Loading extends PatientAppointmentHistoryState {}


class NoAppointmentHistory extends PatientAppointmentHistoryState {}
class CancellingAppointment extends PatientAppointmentHistoryState {}
class AppointmentCancelled extends PatientAppointmentHistoryState {}

class Error extends PatientAppointmentHistoryState {
  final String msg;
  Error(this.msg);
}

class ReceivedAppointmentHistory extends PatientAppointmentHistoryState {
  final List<AppointmentDetailModel> appointments;

  ReceivedAppointmentHistory(this.appointments);
}
