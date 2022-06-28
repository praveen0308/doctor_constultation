// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      ID: json['ID'] as int?,
      UserName: json['UserName'] as String?,
      MobileNo: json['MobileNo'] as String?,
      ProfileImage: json['ProfileImage'] as String?,
      Gender: json['Gender'] as String? ?? "N.A.",
      Age: json['Age'] as int? ?? 0,
      PatientCount: json['PatientCount'] as int? ?? 0,
      AppointmentCount: json['AppointmentCount'] as int? ?? 0,
      EmailID: json['EmailID'] as String?,
      Password: json['Password'] as String?,
      UserRoleID: json['UserRoleID'] as int?,
      LangCulture: json['LangCulture'] as String?,
      RegisteredOn: json['RegisteredOn'] as String?,
      IsActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'ID': instance.ID,
      'UserName': instance.UserName,
      'Gender': instance.Gender,
      'Age': instance.Age,
      'PatientCount': instance.PatientCount,
      'AppointmentCount': instance.AppointmentCount,
      'MobileNo': instance.MobileNo,
      'ProfileImage': instance.ProfileImage,
      'EmailID': instance.EmailID,
      'Password': instance.Password,
      'UserRoleID': instance.UserRoleID,
      'LangCulture': instance.LangCulture,
      'RegisteredOn': instance.RegisteredOn,
      'IsActive': instance.IsActive,
    };
