import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateAchievement extends StatelessWidget {
  final Color bgColor;
  final Color iconColor;
  final String iconImage;
  final String txtTitle;
  final String txtSubtitle;

  const TemplateAchievement({Key? key,
    this.bgColor = AppColors.primaryLightest,
    this.iconColor = AppColors.primary,
    this.iconImage = AppImages.icVoiceCall,
    this.txtTitle = "Title",
    this.txtSubtitle = "Subtitle"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 130,
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: bgColor,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.greyLightest),
            child: SvgPicture.asset(
              iconImage,
              color: iconColor,
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  txtTitle,
                  style: AppTextStyle.headline6(),
                ),
                Text(txtSubtitle,style: AppTextStyle.subtitle3(),)
              ],
            ),

          )
        ],
      ),
    );
  }
}
