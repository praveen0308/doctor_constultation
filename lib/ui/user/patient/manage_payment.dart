import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/payment/template_payment_body.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutManagePayment extends StatelessWidget {
  const LayoutManagePayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBackNavBar(
                imgUrl: AppImages.icBackArrow,
                txtTitle: "Manage Payment",
                navColor: AppColors.primary,
              ),
              TemplatePaymentBody()
            ],
          ),
        ),
      ),
    );
  }
}
