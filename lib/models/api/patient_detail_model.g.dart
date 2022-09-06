// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientDetailModel _$PatientDetailModelFromJson(Map<String, dynamic> json) =>
    PatientDetailModel(
      ID: json['ID'] as int? ?? 0,
      UserID: json['UserID'] as int? ?? 0,
      FullName: json['FullName'] as String? ?? "",
      MobileNo: json['MobileNo'] as String? ?? "",
      ProfileImage: json['ProfileImage'] as String? ?? "",
      DOB: json['DOB'] as String? ?? "",
      Age: json['Age'] as int? ?? 0,
      GenderID: json['GenderID'] as int? ?? 0,
      TypeID: json['TypeID'] as int? ?? 0,
      RelationID: json['RelationID'] as int? ?? 0,
      CreateDateTime: json['CreateDateTime'] as String? ?? "",
      IsActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$PatientDetailModelToJson(PatientDetailModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('UserID', instance.UserID);
  writeNotNull('FullName', instance.FullName);
  writeNotNull('MobileNo', instance.MobileNo);
  writeNotNull('DOB', instance.DOB);
  writeNotNull('Age', instance.Age);
  writeNotNull('GenderID', instance.GenderID);
  writeNotNull('TypeID', instance.TypeID);
  writeNotNull('RelationID', instance.RelationID);
  writeNotNull('CreateDateTime', instance.CreateDateTime);
  writeNotNull('ProfileImage', instance.ProfileImage);
  writeNotNull('IsActive', instance.IsActive);
  return val;
}
