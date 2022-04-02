import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation/models/fb_models/timestamp_converter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_message.g.dart';

class UserMessage {
  int? messageId;
  String? senderId;
  String? msg;
  DateTime? addedOn;
  bool? isSeen;

  UserMessage(
      {this.messageId, this.senderId, this.msg, this.addedOn, this.isSeen});

  factory UserMessage.fromJson(Map<String, dynamic> json) =>
      _$UserMessageFromJson(json);
  Map<String, dynamic> toJson() => _$UserMessageToJson(this);
}
