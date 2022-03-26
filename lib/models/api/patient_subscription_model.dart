import 'package:json_annotation/json_annotation.dart';

part 'patient_subscription_model.g.dart';

@JsonSerializable()
class PatientSubscriptionModel {
  int PatientSubscriptionID;
  int SubscriptionID;
  int PatientID;
  String? SubscriptionStartDate;
  String? SubscriptionEndDate;
  int AllowedCount;
  int UtilizedCount;
  bool IsLapsed;
  bool IsExpired;
  bool IsRenewed;
  bool IsActive;

  PatientSubscriptionModel(
      {this.PatientSubscriptionID = 0,
      this.SubscriptionID = 0,
      this.PatientID = 0,
      this.SubscriptionStartDate,
      this.SubscriptionEndDate,
      this.AllowedCount = 0,
      this.UtilizedCount = 0,
      this.IsLapsed = false,
      this.IsExpired = false,
      this.IsRenewed = false,
      this.IsActive = false});

  factory PatientSubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$PatientSubscriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientSubscriptionModelToJson(this);
}
