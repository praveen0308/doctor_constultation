import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/fb_models/user_message.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/repository/chat_repository.dart';
import 'package:doctor_consultation/repository/communication_repository.dart';
import 'package:meta/meta.dart';

part 'chat_screen_state.dart';

class ChatScreenCubit extends Cubit<ChatScreenState> {
  final ChatRepository _chatRepository = ChatRepository();
  final CommunicationRepository _communicationRepository = CommunicationRepository();
  final _storage = SecureStorage();
  ChatScreenCubit() : super(ChatScreenInitial());

  void addNewMessage(String msg, String chatId, {int patientId = 0}) async {
    
    UserMessage userMessage = UserMessage(
        senderId: patientId.toString(),
        msg: msg,
        addedOn: DateTime.now(),
        isSeen: false);
    await _chatRepository.addNewMessage(userMessage, chatId);
    await _communicationRepository.sendChatNotification(patientId,msg);
  }


}
