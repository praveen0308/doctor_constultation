import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateDateTime extends StatelessWidget {
  final String imgURL;
  final Color dtColor;
  final double imgSize;
  final String title;

  const TemplateDateTime({Key? key,
  this.imgURL = AppImages.icSchedule,
  this.dtColor = AppColors.greyBefore,
  this.imgSize = 15,
  this.title = "19 Aug 2022"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        SvgPicture.asset(imgURL,height: imgSize),
        const SizedBox(
          width: 5,
        ),
        Text(title, style: AppTextStyle.overlieRF1(txtColor: dtColor),)

      ],
    );
  }
}
