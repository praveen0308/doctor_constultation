part of 'add_new_appointment_cubit.dart';

@immutable
abstract class AddNewAppointmentState {}

class AddNewAppointmentInitial extends AddNewAppointmentState {}

class Loading extends AddNewAppointmentState {}

class Error extends AddNewAppointmentState {
  final String msg;
  Error(this.msg);
}

class ReceivedPatientList extends AddNewAppointmentState {
  final List<PatientDetailModel> patients;
  ReceivedPatientList(this.patients);
}

class ReceivedAvailableSlots extends AddNewAppointmentState {
  final List<SlotModel> availableSlots;
  ReceivedAvailableSlots(this.availableSlots);
}
