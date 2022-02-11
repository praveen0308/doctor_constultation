import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/user/admin/communication/payment_detail.dart';
import 'package:doctor_consultation/widgets/btn/search_patient_filter.dart';
import 'package:doctor_consultation/widgets/patient/chat_with_patient.dart';
import 'package:doctor_consultation/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateMessagePageBody extends StatelessWidget {
  const TemplateMessagePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewMyRichText(
          text1: "Today's",
          text2: "Consult",
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
          onTab: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPaymentConfirmation())),
        ),
        TemplateChatWithPatient(
          txtTitle: "Mr. Sunil Yadav",
          txtSubTitle: "Daily Checkup",
          txtAmt: "₹20",
          txtType: "Chat",
          cType: AppColors.successDark,
          bgType: AppColors.successLightest,
          txtIcon: AppImages.icMessage,
          onTab: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPaymentConfirmation())),
        ),
        TemplateChatWithPatient(
          txtTitle: "Mr. Sunil Yadav",
          txtSubTitle: "Daily Checkup",
          txtAmt: "₹20",
          txtType: "Chat",
          cType: AppColors.successDark,
          bgType: AppColors.successLightest,
          txtIcon: AppImages.icMessage,
          onTab: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPaymentConfirmation())),
        ),
        ViewMyRichText(
          text1: "All",
          text2: "Consult's",
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
          onTab: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPaymentConfirmation())),
        ),
        TemplateChatWithPatient(
          txtTitle: "Mr. Sunil Yadav",
          txtSubTitle: "Daily Checkup",
          txtAmt: "₹20",
          txtType: "Chat",
          cType: AppColors.successDark,
          bgType: AppColors.successLightest,
          txtIcon: AppImages.icMessage,
          onTab: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LayoutPaymentConfirmation())),
        ),
      ],
    );
  }
}
