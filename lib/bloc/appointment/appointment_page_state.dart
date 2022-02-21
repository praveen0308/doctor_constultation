part of 'appointment_page_cubit.dart';

@immutable
abstract class AppointmentPageState {}

class AppointmentPageInitial extends AppointmentPageState {}

class AppointmentPageLoading extends AppointmentPageState {}

class AppointmentPageReceived extends AppointmentPageState {}

class AppointmentPageError extends AppointmentPageState {}
