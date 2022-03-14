part of 'purchase_subscription_plan_cubit.dart';

@immutable
abstract class PurchaseSubscriptionPlanState {}

class PurchaseSubscriptionPlanInitial extends PurchaseSubscriptionPlanState {}

class Loading extends PurchaseSubscriptionPlanState {}

class UpdatingPlan extends PurchaseSubscriptionPlanState {}

class OnUpdated extends PurchaseSubscriptionPlanState {
  final bool result;

  OnUpdated(this.result);
}

class ReceivedSubscriptionPlans extends PurchaseSubscriptionPlanState {
  final List<SubscriptionPlanModel> plans;

  ReceivedSubscriptionPlans(this.plans);
}

class Error extends PurchaseSubscriptionPlanState {
  final String msg;

  Error(this.msg);
}
