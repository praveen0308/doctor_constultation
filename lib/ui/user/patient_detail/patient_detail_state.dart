part of 'patient_detail_cubit.dart';

@immutable
abstract class PatientDetailState {}

class PatientDetailInitial extends PatientDetailState {}

class Loading extends PatientDetailState {}

class LoadingAppointmentHistory extends PatientDetailState {}

class Error extends PatientDetailState {
  final String msg;

  Error(this.msg);
}

class ReceivedCaseHistory extends PatientDetailState {
  final List<CaseInfoModel> caseHistory;

  ReceivedCaseHistory(this.caseHistory);
}

class ReceivedPatientDetails extends PatientDetailState {
  final PatientDetailModel patientDetailModel;

  ReceivedPatientDetails(this.patientDetailModel);
}
