import 'package:doctor_consultation/ui/user/patient/communication/chat_with_doctor/main_chat.dart';
import 'package:flutter/cupertino.dart';


class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text("Message page")
    // );
    return MainChatPage();
  }
}
