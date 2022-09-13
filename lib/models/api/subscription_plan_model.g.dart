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
      Discount: (json['Discount'] as num?)?.toDouble() ?? 0.0,
      OfferStartDate: json['OfferStartDate'] as String?,
      OfferEndDate: json['OfferEndDate'] as String?,
      Country: json['Country'] as String?,
      IsActive: json['IsActive'] as bool?,
      IsFixed: json['IsFixed'] as bool? ?? true,
    );

Map<String, dynamic> _$SubscriptionPlanModelToJson(
    SubscriptionPlanModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubscriptionID', instance.SubscriptionID);
  writeNotNull('PlanName', instance.PlanName);
  writeNotNull('PlanDescription', instance.PlanDescription);
  writeNotNull('PlanType', instance.PlanType);
  writeNotNull('CurrencyType', instance.CurrencyType);
  val['Amount'] = instance.Amount;
  writeNotNull('Country', instance.Country);
  writeNotNull('IsActive', instance.IsActive);
  val['Discount'] = instance.Discount;
  writeNotNull('OfferStartDate', instance.OfferStartDate);
  writeNotNull('OfferEndDate', instance.OfferEndDate);
  val['IsFixed'] = instance.IsFixed;
  return val;
}
