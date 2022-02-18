// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientDetailModel _$PatientDetailModelFromJson(Map<String, dynamic> json) =>
    PatientDetailModel(
      ID: json['ID'] as int?,
      UserID: json['UserID'] as int?,
      FullName: json['FullName'] as String?,
      MobileNo: json['MobileNo'] as String?,
      DOB: json['DOB'] as int?,
      Age: json['Age'] as String?,
      GenderID: json['GenderID'] as int?,
      TypeID: json['TypeID'] as int?,
      RelationID: json['RelationID'] as int?,
      CreateDateTime: json['CreateDateTime'] as int?,
      IsActive: json['IsActive'] as bool?,
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
