import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class ViewHeadingAppointment extends StatelessWidget {
  final String txtTitle;
  final String txtSubTitle;
  final String imgURL;
  final double sImg;
  final Color tColor;
  final Color sColor;

  const ViewHeadingAppointment({
    Key? key,
    this.txtTitle = "Title",
    this.txtSubTitle = "",
    this.imgURL = AppImages.icPaymentSummery,
    this.sImg = 30.0,
    this.tColor = AppColors.greyDark,
    this.sColor = AppColors.greyBefore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imgURL,
            height: sImg,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            txtTitle,
            style: AppTextStyle.body1(
                txtColor: tColor, wFont: FontWeight.w500),
          ),
          const Spacer(),
          Text(
            txtSubTitle,
            style: AppTextStyle.subtitle2(
              txtColor: sColor,
            ),
          ),
        ],
      ),
    );
  }
}
