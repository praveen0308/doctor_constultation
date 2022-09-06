// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientSubscriptionModel _$PatientSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    PatientSubscriptionModel(
      PatientSubscriptionID: json['PatientSubscriptionID'] as int? ?? 0,
      SubscriptionID: json['SubscriptionID'] as int? ?? 0,
      PatientID: json['PatientID'] as int? ?? 0,
      SubscriptionStartDate: json['SubscriptionStartDate'] as String?,
      SubscriptionEndDate: json['SubscriptionEndDate'] as String?,
      AllowedCount: json['AllowedCount'] as int? ?? 0,
      UtilizedCount: json['UtilizedCount'] as int? ?? 0,
      IsLapsed: json['IsLapsed'] as bool? ?? false,
      IsExpired: json['IsExpired'] as bool? ?? false,
      IsRenewed: json['IsRenewed'] as bool? ?? false,
      IsActive: json['IsActive'] as bool? ?? false,
    );

Map<String, dynamic> _$PatientSubscriptionModelToJson(
    PatientSubscriptionModel instance) {
  final val = <String, dynamic>{
    'PatientSubscriptionID': instance.PatientSubscriptionID,
    'SubscriptionID': instance.SubscriptionID,
    'PatientID': instance.PatientID,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SubscriptionStartDate', instance.SubscriptionStartDate);
  writeNotNull('SubscriptionEndDate', instance.SubscriptionEndDate);
  val['AllowedCount'] = instance.AllowedCount;
  val['UtilizedCount'] = instance.UtilizedCount;
  val['IsLapsed'] = instance.IsLapsed;
  val['IsExpired'] = instance.IsExpired;
  val['IsRenewed'] = instance.IsRenewed;
  val['IsActive'] = instance.IsActive;
  return val;
}
