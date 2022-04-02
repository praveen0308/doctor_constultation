// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(String id, Map<String, dynamic> json) =>
    ChatResponse(
      chatId: id,
      userId: json['userId'] as String?,
      patientId: json['patientId'] as String?,
      patientName: json['patientName'] as String?,
      lastMessage: json['lastMessage'] as String? ?? "",
      lmAddedOn: json['lmAddedOn'] == null
          ? null
          : const TimestampConverter().fromJson(json['lmAddedOn']),
      expiry: json['expiry'] == null
          ? null
          : const TimestampConverter().fromJson(json['expiry']),
    );

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'patientId': instance.patientId,
      'patientName': instance.patientName,
      'lastMessage': instance.lastMessage,
      'lmAddedOn': instance.lmAddedOn != null
          ? const TimestampConverter().toJson(instance.lmAddedOn!)
          : null,
      'expiry': const TimestampConverter().toJson(instance.expiry!),
    };
