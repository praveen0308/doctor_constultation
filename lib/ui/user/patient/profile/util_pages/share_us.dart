import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShareUs extends StatelessWidget {
  const ShareUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            const AppBackNavBar(
              imgUrl: AppImages.icBackArrow,
              txtTitle: "Share Us",
              navColor: AppColors.primary,
              bgColor: AppColors.greyLightest,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10 * 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0 * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Share with family and friends",
                      style:
                          AppTextStyle.headline6(txtColor: AppColors.primary),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Coz your family and friends so\n Live Life Better",
                        style: AppTextStyle.captionOF1(
                            txtColor: AppColors.greyBefore),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 8.0 / 2 * 5),
                      child: SvgPicture.asset(
                        AppImages.imgShareUs,
                        height: 300,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0 / 2 * 30,left: 15,right: 15),
                        child: BtnFilled(
                          title: "Invite Now",
                          onBtnPressed: () {
                            // Share.share('check out my website https://example.com', subject: 'Look what I made!');
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
