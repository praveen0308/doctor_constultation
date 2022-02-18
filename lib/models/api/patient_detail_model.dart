import 'package:json_annotation/json_annotation.dart';

part 'patient_detail_model.g.dart';

@JsonSerializable()
class PatientDetailModel {
  int? ID;
  int? UserID;
  String? FullName;
  String? MobileNo;
  int? DOB;
  String? Age;
  int? GenderID;
  int? TypeID;
  int? RelationID;
  int? CreateDateTime;
  bool? IsActive;

  PatientDetailModel({this.ID, this.UserID, this.FullName, this.MobileNo, this.DOB, this.Age, this.GenderID, this.TypeID, this.RelationID, this.CreateDateTime, this.IsActive});

  factory PatientDetailModel.fromJson(Map<String, dynamic> json) => _$PatientDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDetailModelToJson(this);
}

