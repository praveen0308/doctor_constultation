part of 'purchase_subscription_plan_cubit.dart';

@immutable
abstract class PurchaseSubscriptionPlanState {}

class PurchaseSubscriptionPlanInitial extends PurchaseSubscriptionPlanState {}

class Loading extends PurchaseSubscriptionPlanState {}
class Processing extends PurchaseSubscriptionPlanState {
  final String msg;

  Processing(this.msg);
}

class UpdatingPlan extends PurchaseSubscriptionPlanState {}

class PlanUpdatedSuccessfully extends PurchaseSubscriptionPlanState {}

class AddingNewAppointment extends PurchaseSubscriptionPlanState {}
class AddingPaymentTransaction extends PurchaseSubscriptionPlanState {}
class TransactionAddedSuccessfully extends PurchaseSubscriptionPlanState {}

class AppointmentAddedSuccessfully extends PurchaseSubscriptionPlanState {
  final int appointmentID;

  AppointmentAddedSuccessfully(this.appointmentID);
}

class AddAppointmentFailed extends PurchaseSubscriptionPlanState {}

class ReceivedSubscriptionPlan extends PurchaseSubscriptionPlanState {
  final SubscriptionPlanModel plan;

  ReceivedSubscriptionPlan(this.plan);
}

class ReceivedSubscriptionPlans extends PurchaseSubscriptionPlanState {
  final List<SubscriptionPlanModel> plans;

  ReceivedSubscriptionPlans(this.plans);
}

class Error extends PurchaseSubscriptionPlanState {
  final String msg;

  Error(this.msg);
}
