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
      DOB: json['DOB'] as String? ?? "",
      Age: json['Age'] as int? ?? 0,
      GenderID: json['GenderID'] as int? ?? 0,
      TypeID: json['TypeID'] as int? ?? 0,
      RelationID: json['RelationID'] as int? ?? 0,
      CreateDateTime: json['CreateDateTime'] as String? ?? "",
      IsActive: json['IsActive'] as bool? ?? true,
    );

Map<String, dynamic> _$PatientDetailModelToJson(PatientDetailModel instance) =>
    <String, dynamic>{
      'ID': instance.ID,
      'UserID': instance.UserID,
      'FullName': instance.FullName,
      'MobileNo': instance.MobileNo,
      'DOB': instance.DOB,
      'Age': instance.Age,
      'GenderID': instance.GenderID,
      'TypeID': instance.TypeID,
      'RelationID': instance.RelationID,
      'CreateDateTime': instance.CreateDateTime,
      'IsActive': instance.IsActive,
    };
