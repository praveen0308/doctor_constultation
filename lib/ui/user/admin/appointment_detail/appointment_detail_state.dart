part of 'appointment_detail_cubit.dart';

@immutable
abstract class AppointmentDetailState {}

class AppointmentDetailInitial extends AppointmentDetailState {}

class LoadingAppointmentDetail extends AppointmentDetailState {}
class Error extends AppointmentDetailState {
  final String msg;
  Error(this.msg);
}

class ReceivedAppointmentDetail extends AppointmentDetailState {
  final AppointmentDetailModel appointmentDetailModel;

  ReceivedAppointmentDetail(this.appointmentDetailModel);
}


class CancellingAppointment extends AppointmentDetailState {}

class AppointmentCancelled extends AppointmentDetailState {}

class StartingSession extends AppointmentDetailState {}

class SessionStarted extends AppointmentDetailState {
  final String meetingId;

  SessionStarted(this.meetingId);
}

class AppointmentClosedSuccessfully extends AppointmentDetailState {}

class FailedOperation extends AppointmentDetailState {
  final String msg;

  FailedOperation(this.msg);

}

