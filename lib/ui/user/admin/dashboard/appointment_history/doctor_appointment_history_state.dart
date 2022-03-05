part of 'doctor_appointment_history_cubit.dart';

@immutable
abstract class DoctorAppointmentHistoryState {}

class DoctorAppointmentHistoryInitial extends DoctorAppointmentHistoryState {}

class Loading extends DoctorAppointmentHistoryState {}

class NoAppointmentsToday extends DoctorAppointmentHistoryState {}

class Error extends DoctorAppointmentHistoryState {
  final String msg;
  Error(this.msg);
}

class ReceivedAppointments extends DoctorAppointmentHistoryState {
  final List<AppointmentDetailModel> appointments;
  ReceivedAppointments(this.appointments);
}
class CancellingAppointment extends DoctorAppointmentHistoryState {}
class AppointmentCancelled extends DoctorAppointmentHistoryState {}
class StartingSession extends DoctorAppointmentHistoryState {}
class SessionStarted extends DoctorAppointmentHistoryState {}