import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/view_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateSelectDate extends StatelessWidget {
  const TemplateSelectDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                "Jan 20, 2022".toUpperCase(),
                style: AppTextStyle.captionRF1(),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(AppImages.icArrowDown,height: 8,color: AppColors.greyDark,)
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppImages.icArrowLeft,color: AppColors.grey,),
            ViewDateContent(
              title: "Mon",
              subTitle: "03",
              mainColor: AppColors.primary,
              innerColor: AppColors.primary,
              outerColor: AppColors.primaryLightest,
            ),
            ViewDateContent(
              title: "Tue",
              subTitle: "04",
              mainColor: AppColors.greyLightest,
              innerColor: AppColors.greyLightest,
              outerColor: AppColors.primary,
            ),
            ViewDateContent(
              title: "Wed",
              subTitle: "05",
              caption: "Booked",
              mainColor: AppColors.greyLightest,
              innerColor: AppColors.greyBefore,
              outerColor: AppColors.greyLight,
            ),
            ViewDateContent(
              title: "Thu",
              subTitle: "06",
              mainColor: AppColors.greyLightest,
              innerColor: AppColors.greyLightest,
              outerColor: AppColors.primary,
            ),
            ViewDateContent(
              title: "Fri",
              subTitle: "07",
              mainColor: AppColors.greyLightest,
              innerColor: AppColors.greyLightest,
              outerColor: AppColors.primary,
            ),
            SvgPicture.asset(AppImages.icArrowRight,color: AppColors.greyDark,)
          ],
        )
      ],
    );
  }
}
