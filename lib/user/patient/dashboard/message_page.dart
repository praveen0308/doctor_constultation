import 'package:doctor_consultation/widgets/btn/btn_icon_tab.dart';
import 'package:flutter/cupertino.dart';

import '../communication/chat_with_doctor/main_chat.dart';

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
