import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/patient/chat_with_patient.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class TemplateMessagePageBody extends StatelessWidget {
  const TemplateMessagePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewMyRichText(
          text1: "Patient's",
          text2: "Messages",
          txtStyle1: AppTextStyle.subtitle1(),
          txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
        ),
        TemplateChatWithPatient(
          txtTitle: "Mr. Sunil Yadav",
          txtSubTitle: "Daily Checkup",
          txtAmt: "₹200",
          txtType: "Video",
          cType: AppColors.primary,
          bgType: AppColors.primaryLightest,
          txtIcon: AppImages.icUnMuteVideoCall,
          onTab: () =>
              Navigator.pushNamed(context, route.layoutPaymentConfirmation),
        ),
        /*TemplateChatWithPatient(
          txtTitle: "Mr. Sunil Yadav",
          txtSubTitle: "Daily Checkup",
          txtAmt: "₹20",
          txtType: "Chat",
          cType: AppColors.successDark,
          bgType: AppColors.successLightest,
          txtIcon: AppImages.icMessage,
          onTab: () =>
              Navigator.pushNamed(context, route.layoutPaymentConfirmation),
        ),*/
      ],
    );
  }
}
