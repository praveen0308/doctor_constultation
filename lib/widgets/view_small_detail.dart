import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';

class ViewSmallDetail extends StatelessWidget {
  final String title;
  final String subTitle;

  const ViewSmallDetail({
    Key? key,
    this.title = "Title",
    this.subTitle = "SubTitle",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(title,style: AppTextStyle.subtitle3(txtColor: AppColors.greyBefore),),
        const SizedBox(
          height: 5,
        ),
        Text(subTitle,style: AppTextStyle.body1(txtColor: AppColors.greyDark,wFont: FontWeight.w500),),
      ],
    );
  }
}
