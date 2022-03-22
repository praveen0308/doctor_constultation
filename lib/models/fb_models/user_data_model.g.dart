// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      userUId: json['userUId'] as int?,
      userId: json['userId'] as int?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      mobileNo: json['mobileNo'] as String?,
      addedOn: json['addedOn'] as String?,
      isActive: json['isActive'] as String?,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'userUId': instance.userUId,
      'userId': instance.userId,
      'userName': instance.userName,
      'email': instance.email,
      'mobileNo': instance.mobileNo,
      'addedOn': instance.addedOn,
      'isActive': instance.isActive,
    };
