import 'package:json_annotation/json_annotation.dart';

part 'subscription_plan_model.g.dart';

@JsonSerializable()
class SubscriptionPlanModel {
  int? SubscriptionID;
  String? PlanName;
  String? PlanDescription;
  int? PlanType;
  String? CurrencyType;
  int? Amount;
  String? Country;
  bool? IsActive;

  SubscriptionPlanModel({this.SubscriptionID, this.PlanName, this.PlanDescription, this.PlanType, this.CurrencyType, this.Amount, this.Country, this.IsActive});

  factory SubscriptionPlanModel.fromJson(Map<String, dynamic> json) => _$SubscriptionPlanModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionPlanModelToJson(this);
}

