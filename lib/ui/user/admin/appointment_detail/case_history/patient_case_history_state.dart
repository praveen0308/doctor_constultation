part of 'patient_case_history_cubit.dart';

@immutable
abstract class PatientCaseHistoryState {}

class PatientCaseHistoryInitial extends PatientCaseHistoryState {}
class Loading extends PatientCaseHistoryState {}
class NoCaseHistory extends PatientCaseHistoryState {}
class ReceivedCaseHistory extends PatientCaseHistoryState {
  final List<CaseInfoModel> caseHistory;

  ReceivedCaseHistory(this.caseHistory);
}
