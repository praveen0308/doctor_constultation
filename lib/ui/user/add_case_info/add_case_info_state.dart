part of 'add_case_info_cubit.dart';

@immutable
abstract class AddCaseInfoState {}

class AddCaseInfoInitial extends AddCaseInfoState {}
class Loading extends AddCaseInfoState {}
class AddedSuccessfully extends AddCaseInfoState {}
class Error extends AddCaseInfoState {
  final String msg;

  Error(this.msg);
}
