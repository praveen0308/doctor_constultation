import 'package:json_annotation/json_annotation.dart';
part 'user_message.g.dart';

@JsonSerializable()
class UserMessage {
  int? messageId;
  String? sentBy;
  String? senderId;
  String? receiverId;
  String? msg;
  String? addedOn;
  String? isSeen;

  UserMessage(
      {this.messageId,
      this.sentBy,
      this.senderId,
      this.receiverId,
      this.msg,
      this.addedOn,
      this.isSeen});

  factory UserMessage.fromJson(Map<String, dynamic> json) =>
      _$UserMessageFromJson(json);
  Map<String, dynamic> toJson() => _$UserMessageToJson(this);
}
