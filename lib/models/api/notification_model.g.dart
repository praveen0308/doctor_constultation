// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      NotificationID: json['NotificationID'] as int?,
      ReceiverID: json['ReceiverID'] as int?,
      SenderID: json['SenderID'] as int?,
      Title: json['Title'] as String?,
      Description: json['Description'] as String?,
      ImageUrl: json['ImageUrl'] as String?,
      IsSeen: json['IsSeen'] as bool?,
      ContentID: json['ContentID'] as int?,
      ContentTypeID: json['ContentTypeID'] as int?,
      IsActive: json['IsActive'] as bool?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'NotificationID': instance.NotificationID,
      'ReceiverID': instance.ReceiverID,
      'SenderID': instance.SenderID,
      'Title': instance.Title,
      'Description': instance.Description,
      'ImageUrl': instance.ImageUrl,
      'IsSeen': instance.IsSeen,
      'ContentID': instance.ContentID,
      'ContentTypeID': instance.ContentTypeID,
      'IsActive': instance.IsActive,
    };
