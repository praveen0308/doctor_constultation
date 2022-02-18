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
        UserSubscriptionModel instance) =>
    <String, dynamic>{
      'UserSubscriptionID': instance.UserSubscriptionID,
      'SubscriptionID': instance.SubscriptionID,
      'UserID': instance.UserID,
      'SubscriptionStartDate': instance.SubscriptionStartDate,
      'SubscriptionEndDate': instance.SubscriptionEndDate,
      'AllowedCount': instance.AllowedCount,
      'UtilizedCount': instance.UtilizedCount,
      'IsLapsed': instance.IsLapsed,
      'IsExpired': instance.IsExpired,
      'IsRenewed': instance.IsRenewed,
      'IsActive': instance.IsActive,
    };
