part of 'manage_plans_cubit.dart';

@immutable
abstract class ManagePlansState {}

class ManagePlansInitial extends ManagePlansState {}
class Loading extends ManagePlansState {}
class Deleting extends ManagePlansState {}
class SuccessfullyDeleted extends ManagePlansState {}
class DeletionFailed extends ManagePlansState {}
class ReceivedPlans extends ManagePlansState {
  final List<SubscriptionPlanModel> plans;
  ReceivedPlans(this.plans);
}
class Error extends ManagePlansState {
  final String msg;

  Error(this.msg);
}

