import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/view_address_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAddresses extends StatelessWidget {
  const MyAddresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AppBackNavBar(
              imgUrl: AppImages.icBackArrow,
              txtTitle: "My Addresses",
              navColor: AppColors.primary,
              bgColor: AppColors.greyLightest,
            ),
            ViewAddressDetail(
              txtTitle: "Home",
              txtSubTitle: "Jari Mari Devi Mandir Chawl, Kurla - Andheri Road, Mumbai",
            ),
            ViewAddressDetail(
              txtTitle: "Other",
              txtSubTitle: "Sagbhag Bld No. 5, Wing B, Flat No. 1119",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12*10),
              child: BtnFilled(title: "Add Address",),
            )
          ],
        ),
      ),
    );
  }
}
