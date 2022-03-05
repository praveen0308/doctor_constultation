part of 'appointment_detail_for_patient_cubit.dart';

@immutable
abstract class AppointmentDetailForPatientState {}

class AppointmentDetailForPatientInitial extends AppointmentDetailForPatientState {}
class CancellingAppointment extends AppointmentDetailForPatientState {}
class AppointmentCancelled extends AppointmentDetailForPatientState {}

class LoadingAppointmentDetail extends AppointmentDetailForPatientState {}
class ReceivedAppointmentDetail extends AppointmentDetailForPatientState {
  final AppointmentDetailModel appointmentDetailModel;

  ReceivedAppointmentDetail(this.appointmentDetailModel);
}
class Error extends AppointmentDetailForPatientState {
  final String msg;

  Error(this.msg);
}
