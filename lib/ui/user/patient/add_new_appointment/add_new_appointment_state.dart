part of 'add_new_appointment_cubit.dart';

@immutable
abstract class AddNewAppointmentState {}

class AddNewAppointmentInitial extends AddNewAppointmentState {}

class AddingNewAppointment extends AddNewAppointmentState {}

class AppointmentAddedSuccessfully extends AddNewAppointmentState {}

class AddAppointmentFailed extends AddNewAppointmentState {}

class AddNewAppointmentError extends AddNewAppointmentState {
  final String msg;
  AddNewAppointmentError(this.msg);
}
