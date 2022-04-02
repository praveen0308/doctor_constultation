import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation/models/fb_models/chat_response.dart';
import 'package:doctor_consultation/models/fb_models/user_data_model.dart';
import 'package:doctor_consultation/models/fb_models/user_message.dart';
import 'package:flutter/cupertino.dart';

class ChatRepository {
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection('Users');
  static final CollectionReference _chats =
      FirebaseFirestore.instance.collection('Chats');

  Future<void> addNewUser(UserDataModel userData) async {
    var response = await _users.add(userData.toJson());

    debugPrint("Response :: $response");
  }

  Future<UserDataModel> getUserById(String userId) async {
    var response = await _users.doc(userId).get();

    debugPrint("Response :: $response");
    return UserDataModel.fromJson(response.data() as Map<String, dynamic>);
  }

  Future<void> getUsers() async {
    var response = await _users.get();

    debugPrint("Response :: $response");
  }

  Future<List<ChatResponse>> getUserChats() async {
    var response = await _chats.get();

    List<ChatResponse> chats = response.docs
        .map((e) =>
            ChatResponse.fromJson(e.id, e.data() as Map<String, dynamic>))
        .toList();

    /*  for (var chat in chats) {
      chat.user = await getUserById(chat.userId!);
    }*/
    debugPrint("Response :: $response");
    return chats;
  }

  Future<void> createChat(ChatResponse chat) async {
    var response = await _chats.add(chat.toJson());

    debugPrint("Response :: $response");
  }

  static Future<ChatResponse?> getChatByUserId(String patientId) async {
    var response = await _chats.where("patientId", isEqualTo: patientId).get();
    debugPrint("Response :: $response");
    if (response.size != 0) {
      ChatResponse chat = ChatResponse.fromJson(response.docs.first.id,
          response.docs.first.data() as Map<String, dynamic>);

      return chat;
    } else {
      return null;
    }
  }

  Future<void> addNewMessage(UserMessage message, String chatID) async {
    var chatObj =
        await _chats.doc(chatID).collection("messages").add(message.toJson());

    await _chats
        .doc(chatID)
        .update({"lastMessage": message.msg, "lmAddedOn": message.addedOn});
    debugPrint("Response :: $chatObj");
  }
}
