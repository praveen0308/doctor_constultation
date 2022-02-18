import 'package:json_annotation/json_annotation.dart';

part 'user_subscription_model.g.dart';

@JsonSerializable()
class UserSubscriptionModel {
  int? UserSubscriptionID;
  int? SubscriptionID;
  int? UserID;
  int? SubscriptionStartDate;
  int? SubscriptionEndDate;
  int? AllowedCount;
  int? UtilizedCount;
  bool? IsLapsed;
  bool? IsExpired;
  bool? IsRenewed;
  bool? IsActive;

  UserSubscriptionModel({this.UserSubscriptionID, this.SubscriptionID, this.UserID, this.SubscriptionStartDate, this.SubscriptionEndDate, this.AllowedCount, this.UtilizedCount, this.IsLapsed, this.IsExpired, this.IsRenewed, this.IsActive});

  factory UserSubscriptionModel.fromJson(Map<String, dynamic> json) => _$UserSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSubscriptionModelToJson(this);
}

