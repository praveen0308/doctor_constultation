part of 'add_new_appointment_cubit.dart';

@immutable
abstract class AddNewAppointmentState {}

class AddNewAppointmentInitial extends AddNewAppointmentState {}

class LoadingSubscriptionPlan extends AddNewAppointmentState {}

class ReceivedSubscriptionPlan extends AddNewAppointmentState {
  final SubscriptionPlanModel subscription;

  ReceivedSubscriptionPlan(this.subscription);
}

class AddingNewAppointment extends AddNewAppointmentState {}

class AppointmentAddedSuccessfully extends AddNewAppointmentState {}

class AddAppointmentFailed extends AddNewAppointmentState {}

class FetchingSubscriptionFailed extends AddNewAppointmentState {
  final String msg;
  FetchingSubscriptionFailed(this.msg);
}

class AddNewAppointmentError extends AddNewAppointmentState {
  final String msg;
  AddNewAppointmentError(this.msg);
}
