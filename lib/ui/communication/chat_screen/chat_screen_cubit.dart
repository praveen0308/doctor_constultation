import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/fb_models/user_message.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/repository/chat_repository.dart';
import 'package:meta/meta.dart';

part 'chat_screen_state.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  final ChatRepository _chatRepository = ChatRepository();
  final _storage = SecureStorage();
  ChatScreenCubit() : super(ChatScreenInitial());

  void addNewMessage(String msg, String chatId, {int patientId = 0}) async {
    var userId = 0;
    var userRoleID = await _storage.getUserRoleId();
    if (userRoleID == UserRoles.doctor) {
      userId = await _storage.getUserId();
    } else {
      userId = patientId;
    }

    UserMessage userMessage = UserMessage(
        senderId: userId.toString(),
        msg: msg,
        addedOn: DateTime.now(),
        isSeen: false);
    await _chatRepository.addNewMessage(userMessage, chatId);
  }
}
