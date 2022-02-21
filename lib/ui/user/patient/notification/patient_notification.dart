import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_filter_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/template_schedule_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children: [
              AppBackFilterNavBar(imgUrl1: AppImages.icBackArrow,txtTitle: "Notification",),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        "Your next appoinment",
                        style: AppTextStyle.body3(txtColor: AppColors.greyDark)
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: TemplateScheduleDetail(appointmentDetailModel: null,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
