import 'package:doctor_consultation/ui/user/admin/communication/chat/meassage_page_body.dart';
import 'package:doctor_consultation/ui/user/admin/communication/chat/meassage_page_header.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
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
