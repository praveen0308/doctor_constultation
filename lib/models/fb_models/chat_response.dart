import 'package:doctor_consultation/models/fb_models/timestamp_converter.dart';
import 'package:doctor_consultation/models/fb_models/user_data_model.dart';

part 'chat_response.g.dart';

class ChatResponse {
  String? chatId;
  String? userId;
  String? patientId;
  String? patientName;
  String? lastMessage;
  DateTime? lmAddedOn;
  DateTime? expiry;

  ChatResponse(
      {this.chatId,
      this.userId,
      this.patientId,
      this.patientName,
      this.lastMessage = "",
      this.lmAddedOn,
      this.expiry});

  factory ChatResponse.fromJson(String id, Map<String, dynamic> json) =>
      _$ChatResponseFromJson(id, json);

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
