import 'package:json_annotation/json_annotation.dart';

part 'prescription_model.g.dart';

@JsonSerializable()
class PrescriptionModel {
  int? PrescriptionID;
  int? VideoCallID;
  String? Advice;
  String? SugRegimen;
  String? Investigations;
  String? FollowupDays;

  PrescriptionModel({this.PrescriptionID, this.VideoCallID, this.Advice, this.SugRegimen, this.Investigations, this.FollowupDays});

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) => _$PrescriptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrescriptionModelToJson(this);
}

