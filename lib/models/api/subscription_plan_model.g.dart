// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionPlanModel _$SubscriptionPlanModelFromJson(
        Map<String, dynamic> json) =>
    SubscriptionPlanModel(
      SubscriptionID: json['SubscriptionID'] as int?,
      PlanName: json['PlanName'] as String?,
      PlanDescription: json['PlanDescription'] as String?,
      PlanType: json['PlanType'] as int?,
      CurrencyType: json['CurrencyType'] as String?,
      Amount: (json['Amount'] as num?)?.toDouble() ?? 0.0,
      Country: json['Country'] as String?,
      IsActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$SubscriptionPlanModelToJson(
        SubscriptionPlanModel instance) =>
    <String, dynamic>{
      'SubscriptionID': instance.SubscriptionID,
      'PlanName': instance.PlanName,
      'PlanDescription': instance.PlanDescription,
      'PlanType': instance.PlanType,
      'CurrencyType': instance.CurrencyType,
      'Amount': instance.Amount,
      'Country': instance.Country,
      'IsActive': instance.IsActive,
    };
