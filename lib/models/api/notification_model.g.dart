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
      AddedOn: json['AddedOn'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NotificationID', instance.NotificationID);
  writeNotNull('ReceiverID', instance.ReceiverID);
  writeNotNull('SenderID', instance.SenderID);
  writeNotNull('Title', instance.Title);
  writeNotNull('Description', instance.Description);
  writeNotNull('ImageUrl', instance.ImageUrl);
  writeNotNull('IsSeen', instance.IsSeen);
  writeNotNull('ContentID', instance.ContentID);
  writeNotNull('ContentTypeID', instance.ContentTypeID);
  writeNotNull('IsActive', instance.IsActive);
  writeNotNull('AddedOn', instance.AddedOn);
  return val;
}
