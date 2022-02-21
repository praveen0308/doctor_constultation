part of 'appointment_history_cubit.dart';

@immutable
abstract class AppointmentHistoryState {}

class AppointmentHistoryInitial extends AppointmentHistoryState {}
class Loading extends AppointmentHistoryState {}
class Error extends AppointmentHistoryState {
  final String msg;
  Error(this.msg);
}
class ReceivedAppointHistory extends AppointmentHistoryState {
  final List<AppointmentDetailModel> appointments;

  ReceivedAppointHistory(this.appointments);
}
