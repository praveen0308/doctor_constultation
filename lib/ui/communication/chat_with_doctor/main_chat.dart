import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/chat_with_dr_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/bottom_nav_bar/bottom_chat_nav.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainChatPage extends StatefulWidget {
  const MainChatPage({Key? key}) : super(key: key);

  @override
  _MainChatPageState createState() => _MainChatPageState();
}

class _MainChatPageState extends State<MainChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: Column(
            children: [
              AppChatNavBar(),
              Flexible(
                child: Container(
                  color: AppColors.greyLight,
                  child: ListView(
                    children: [

                    ],
                  ),
                ),
              ),
              TemplateBottomChatNav()
            ],

          ),
        ),
      ),
    );
  }
}
