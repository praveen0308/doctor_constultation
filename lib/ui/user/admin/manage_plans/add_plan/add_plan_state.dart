part of 'add_plan_cubit.dart';

@immutable
abstract class AddPlanState {}

class AddPlanInitial extends AddPlanState {}
class Loading extends AddPlanState {}
class OperationSuccessful extends AddPlanState {}
class OperationFailed extends AddPlanState {}
class Error extends AddPlanState {
  final String msg;

  Error(this.msg);
}

