part of 'appointment_available_slots_cubit.dart';

@immutable
abstract class AppointmentAvailableSlotsState {}

class AppointmentAvailableSlotsInitial extends AppointmentAvailableSlotsState {}

class Loading extends AppointmentAvailableSlotsState {}

class Error extends AppointmentAvailableSlotsState {
  final String msg;
  Error(this.msg);
}

class ReceivedAvailableSlots extends AppointmentAvailableSlotsState {
  final List<ScheduleModel> availableSlots;
  ReceivedAvailableSlots(this.availableSlots);
}

class NoSlots extends AppointmentAvailableSlotsState {}
