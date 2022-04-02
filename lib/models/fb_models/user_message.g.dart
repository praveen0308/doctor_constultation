// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMessage _$UserMessageFromJson(Map<String, dynamic> json) => UserMessage(
      messageId: json['messageId'] as int?,
      senderId: json['senderId'] as String?,
      msg: json['msg'] as String?,
      addedOn: json['addedOn'] == null
          ? null
          : const TimestampConverter().fromJson(json['addedOn']),
      isSeen: json['isSeen'] as bool?,
    );

Map<String, dynamic> _$UserMessageToJson(UserMessage instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'senderId': instance.senderId,
      'msg': instance.msg,
      'addedOn': const TimestampConverter().toJson(instance.addedOn!),
      'isSeen': instance.isSeen,
    };
