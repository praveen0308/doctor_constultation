import 'package:json_annotation/json_annotation.dart';

part 'patient_detail_model.g.dart';

@JsonSerializable()
class PatientDetailModel {
  int? ID;
  int? UserID;
  String? FullName;
  String? MobileNo;
  String? DOB;
  int? Age;
  int? GenderID;
  int? TypeID;
  int? RelationID;
  String? CreateDateTime;
  bool? IsActive;

  PatientDetailModel(
      {this.ID = 0,
      this.UserID = 0,
      this.FullName = "",
      this.MobileNo = "",
      this.DOB = "",
      this.Age = 0,
      this.GenderID = 0,
      this.TypeID = 0,
      this.RelationID = 0,
      this.CreateDateTime = "",
      this.IsActive = true});

  factory PatientDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PatientDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientDetailModelToJson(this);
}
