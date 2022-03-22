import 'package:doctor_consultation/repository/chat_repository.dart';
import 'package:doctor_consultation/ui/communication/chat/meassage_page_header.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/material.dart';

class UserChats extends StatefulWidget {
  const UserChats({Key? key}) : super(key: key);

  @override
  State<UserChats> createState() => _UserChatsState();
}

class _UserChatsState extends State<UserChats> {
  @override
  void initState() {
    super.initState();

    // ChatRepository().getChatByUserId(userId);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: SafeArea(
        child: Scaffold(
            body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            AppNavBar(
              txtAddress: "",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TemplateMessagePageHeader(),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
