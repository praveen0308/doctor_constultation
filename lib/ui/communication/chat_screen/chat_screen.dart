import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/fb_models/user_message.dart';
import 'package:doctor_consultation/repository/chat_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/communication/chat_screen/chat_screen_cubit.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/chat_with_dr_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/bottom_nav_bar/bottom_chat_nav.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:intl/intl.dart';

class ChatScreenArgs {
  final String userId;
  final String patientId;
  final String userName;
  final String chatId;
  final bool isExpired;

  ChatScreenArgs(this.userId,this.patientId, this.userName, this.chatId, this.isExpired);
}

class ChatScreen extends StatefulWidget {
  final ChatScreenArgs args;

  const ChatScreen({Key? key, required this.args}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  late ChatScreenCubit _cubit;
  final ScrollController _controller = ScrollController();
  var userId = 0;
  void _scrollDown() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<ChatScreenCubit>(context);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primary,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: AppColors.primary));


  }

  @override
  void dispose() {
    _controller.dispose();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.args.userName,style: const TextStyle(color: Colors.white),),
          backgroundColor: AppColors.primary,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            // AppChatNavBar(),
            Expanded(
              child: Container(
                  color: AppColors.greyLightest,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FirestoreListView<UserMessage>(
                    controller: _controller,
                    shrinkWrap: true,
                    reverse: true,
                    query: FirebaseFirestore.instance
                        .collection('Chats')
                        .doc(widget.args.chatId)
                        .collection("messages")
                        .orderBy('addedOn', descending: true)
                        .withConverter<UserMessage>(
                          fromFirestore: (snapshot, _) =>
                              UserMessage.fromJson(snapshot.data()!),
                          toFirestore: (resp, _) => resp.toJson(),
                        ),
                    itemBuilder: (context, snapshot) {
                      // Data is now typed!
                      UserMessage resp = snapshot.data();
                      return getChatItem(resp.msg!, resp.addedOn!,
                          resp.senderId == widget.args.userId);
                    },
                  )),
            ),
            widget.args.isExpired
                ? Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.primaryLight,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(
                        child: Text(
                      "Your chat session expired. Renew subscription to chat again!!!",
                      style: AppTextStyle.overlieRF1(),
                    )),
                  )
                : TemplateBottomChatNav(
                    onSend: (String msg) {
                      _cubit.addNewMessage(msg, widget.args.chatId,
                          patientId: int.parse(widget.args.userId));
                    },
                  )
          ],
        ),
      ),
    );
  }

  Widget getChatItem(String msg, DateTime time, bool isSender) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8,minWidth: 120),
                  child: Container(

                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: const EdgeInsets.symmetric(vertical: 5),

                    decoration: BoxDecoration(
                        // border: isSender ? Border.all(color: AppColors.primary) : Border.all(color: AppColors.primaryLight),
                        color:
                            isSender ? AppColors.primary : AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        msg,
                        style: TextStyle(
                        fontSize: 16,
                            color: isSender ? Colors.white : AppColors.primaryDarkest),

                      ),
                    ),

                  ),
                ),

                Positioned(
                  bottom: 10,
                  right: 8,
                  child: Text(
                    DateFormat('MMM dd, hh:mm a').format(time),style: AppTextStyle.overlieRF4(txtColor: isSender ? Colors.white : AppColors.grey,),
                  ),
                )
              ],
            )
          ],
        ));

  }


}
