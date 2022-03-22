import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation/models/fb_models/user_data_model.dart';
import 'package:doctor_consultation/models/fb_models/user_message.dart';
import 'package:flutter/cupertino.dart';

class ChatRepository {
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection('Users');
  static final CollectionReference _chats =
      FirebaseFirestore.instance.collection('Chats');

  Future<void> addNewUser(UserDataModel userData) async {
    var response = await _users.add(userData);

    debugPrint("Response :: $response");
  }

  Future<void> getUsers() async {
    var response = await _users.get();

    debugPrint("Response :: $response");
  }

  Future<void> getChatByUserId(String userId) async {
    var response = await _chats.doc(userId).get();
    debugPrint("Response :: $response");
  }

  Future<void> addNewMessage(UserMessage message) async {
    var response = await _chats.add(message);

    debugPrint("Response :: $response");
  }
}
