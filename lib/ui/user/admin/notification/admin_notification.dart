import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_filter_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/template_schedule_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminNotificationPage extends StatefulWidget {
  const AdminNotificationPage({Key? key}) : super(key: key);

  @override
  _AdminNotificationPageState createState() => _AdminNotificationPageState();
}

class _AdminNotificationPageState extends State<AdminNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children: [
              AppBackFilterNavBar(imgUrl1: AppImages.icBackArrow,txtTitle: "Reschedule",),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TemplateScheduleDetail(),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
