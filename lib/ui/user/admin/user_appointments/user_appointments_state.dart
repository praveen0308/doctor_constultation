part of 'user_appointments_cubit.dart';

@immutable
abstract class UserAppointmentsState {}

class UserAppointmentsInitial extends UserAppointmentsState {}
class Loading extends UserAppointmentsState {}
class NoAppointmentHistory extends UserAppointmentsState {}
class AppointmentCancelled extends UserAppointmentsState {}
class ReceivedAppointments extends UserAppointmentsState {
  final List<AppointmentDetailModel> appointments;

  ReceivedAppointments(this.appointments);
}
class Error extends UserAppointmentsState {
  final String msg;

  Error(this.msg);
}



class StartingSession extends UserAppointmentsState {}

class SessionStarted extends UserAppointmentsState {}