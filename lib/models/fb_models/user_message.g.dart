// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) => UserMessage(
      messageId: json['messageId'] as int?,
      sentBy: json['sentBy'] as String?,
      senderId: json['senderId'] as String?,
      receiverId: json['receiverId'] as String?,
      msg: json['msg'] as String?,
      addedOn: json['addedOn'] as String?,
      isSeen: json['isSeen'] as String?,
    );

Map<String, dynamic> _$UserMessageToJson(UserMessage instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'sentBy': instance.sentBy,
      'senderId': instance.senderId,
      'receiverId': instance.receiverId,
      'msg': instance.msg,
      'addedOn': instance.addedOn,
      'isSeen': instance.isSeen,
    };
