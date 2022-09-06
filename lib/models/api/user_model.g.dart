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

Map<String, dynamic> _$UserModelToJson(UserModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ID', instance.ID);
  writeNotNull('UserName', instance.UserName);
  val['Gender'] = instance.Gender;
  val['Age'] = instance.Age;
  val['PatientCount'] = instance.PatientCount;
  val['AppointmentCount'] = instance.AppointmentCount;
  writeNotNull('MobileNo', instance.MobileNo);
  writeNotNull('ProfileImage', instance.ProfileImage);
  writeNotNull('EmailID', instance.EmailID);
  writeNotNull('Password', instance.Password);
  writeNotNull('UserRoleID', instance.UserRoleID);
  writeNotNull('LangCulture', instance.LangCulture);
  writeNotNull('RegisteredOn', instance.RegisteredOn);
  writeNotNull('IsActive', instance.IsActive);
  return val;
}
