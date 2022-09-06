// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSubscriptionModel _$UserSubscriptionModelFromJson(
        Map<String, dynamic> json) =>
    UserSubscriptionModel(
      UserSubscriptionID: json['UserSubscriptionID'] as int?,
      SubscriptionID: json['SubscriptionID'] as int?,
      UserID: json['UserID'] as int?,
      SubscriptionStartDate: json['SubscriptionStartDate'] as int?,
      SubscriptionEndDate: json['SubscriptionEndDate'] as int?,
      AllowedCount: json['AllowedCount'] as int?,
      UtilizedCount: json['UtilizedCount'] as int?,
      IsLapsed: json['IsLapsed'] as bool?,
      IsExpired: json['IsExpired'] as bool?,
      IsRenewed: json['IsRenewed'] as bool?,
      IsActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$UserSubscriptionModelToJson(
    UserSubscriptionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('UserSubscriptionID', instance.UserSubscriptionID);
  writeNotNull('SubscriptionID', instance.SubscriptionID);
  writeNotNull('UserID', instance.UserID);
  writeNotNull('SubscriptionStartDate', instance.SubscriptionStartDate);
  writeNotNull('SubscriptionEndDate', instance.SubscriptionEndDate);
  writeNotNull('AllowedCount', instance.AllowedCount);
  writeNotNull('UtilizedCount', instance.UtilizedCount);
  writeNotNull('IsLapsed', instance.IsLapsed);
  writeNotNull('IsExpired', instance.IsExpired);
  writeNotNull('IsRenewed', instance.IsRenewed);
  writeNotNull('IsActive', instance.IsActive);
  return val;
}
