
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/btn/btn_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../user/patient/dashboard/dashboard.dart';
import '../user/patient/dashboard/message_page.dart';

class DrProfileHeader extends StatefulWidget {
  const DrProfileHeader({Key? key}) : super(key: key);

  @override
  _DrProfileHeaderState createState() => _DrProfileHeaderState();
}

class _DrProfileHeaderState extends State<DrProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
        ),
        Row(

          children: [
            Container(
              height: 150,
              width: 117,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),bottomRight: Radius.circular(20.0)),
                image: DecorationImage(
                  image: AssetImage(AppImages.drPriyanka),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Dr. Priyanka Yaduvanshi", style: AppTextStyle.headline6(txtColor: AppColors.greyLightest)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Ayurveda Specialist".toUpperCase(),
                      style: const TextStyle(color: AppColors.greyLight),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BtnCircle(
                          iconImage: AppImages.icVoiceCall,
                          iconColor: AppColors.primary,
                          bgColor: AppColors.primaryLightest,
                          sColor: AppColors.primaryLight,
                          iconSize: 20, tabPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPatient())),
                        ),
                        BtnCircle(
                          iconImage: AppImages.icUnMuteVideoCall,
                          iconColor: AppColors.primary,
                          bgColor: AppColors.primaryLightest,
                          sColor: AppColors.primaryLight,
                          iconSize: 20, tabPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardPatient())),
                        ),
                        BtnCircle(
                          iconImage: AppImages.icMessage,
                          iconColor: AppColors.primary,
                          bgColor: AppColors.primaryLightest,
                          sColor: AppColors.primaryLight,
                          iconSize: 20, tabPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage())),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
