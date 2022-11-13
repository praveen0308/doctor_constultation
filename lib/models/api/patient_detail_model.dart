import 'package:json_annotation/json_annotation.dart';

import '../../network/utils/api_constats.dart';

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
  String? ProfileImage;
  bool? IsActive;

  PatientDetailModel(
      {this.ID = 0,
      this.UserID = 0,
      this.FullName = "",
      this.MobileNo = "",
      this.ProfileImage = "",
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

  String getGender() {
    String gender = "";
    switch (GenderID) {
      case 0:
        gender = "Others";
        break;
      case 1:
        gender = "Male";
        break;
      case 2:
        gender = "Female";
        break;
    }
    return gender;
  }

  String getProfileUrl() => ProfileImage==null || ProfileImage!.isEmpty? "" :"${ApiConstants.baseUrl}$ProfileImage";
}
