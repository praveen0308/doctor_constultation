import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/communication/chat/meassage_page_body.dart';
import 'package:doctor_consultation/ui/user/admin/communication/chat/meassage_page_header.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/widgets/btn/btn_icon_tab.dart';
import 'package:doctor_consultation/widgets/btn/search_patient_filter.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorMessagePage extends StatefulWidget {
  const DoctorMessagePage({Key? key}) : super(key: key);

  @override
  _DoctorMessagePageState createState() => _DoctorMessagePageState();
}

class _DoctorMessagePageState extends State<DoctorMessagePage> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text("Message page")
    // );
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: SafeArea(
        child: Scaffold(
          body:ListView(
            scrollDirection: Axis.vertical,
            children: [
              AppNavBar(
                txtAddress: "Marine Line, Mumbai",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TemplateMessagePageHeader(),
                    TemplateMessagePageBody()
                  ],
                ),
              ),

            ],
          )
        ),
      ),
    );
  }
}
