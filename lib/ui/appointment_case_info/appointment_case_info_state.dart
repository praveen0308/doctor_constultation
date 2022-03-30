part of 'appointment_case_info_cubit.dart';

@immutable
abstract class AppointmentCaseInfoState {}

class AppointmentCaseInfoInitial extends AppointmentCaseInfoState {}

class LoadingCaseInfo extends AppointmentCaseInfoState {}

class Error extends AppointmentCaseInfoState {
  final String msg;

  Error(this.msg);
}

class EmptyCaseDetail extends AppointmentCaseInfoState {}

class ReceivedCaseDetail extends AppointmentCaseInfoState {
  final CaseInfoModel caseInfoModel;

  ReceivedCaseDetail(this.caseInfoModel);
}
