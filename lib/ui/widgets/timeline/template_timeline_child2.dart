import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';

class TemplateTimelineEductionChild extends StatelessWidget {
  final String txtYear;
  final String txtMonth;
  final String txtTitle;
  final String txtSubTitle;

  const TemplateTimelineEductionChild({
    Key? key,
    this.txtYear = "YYYY",
    this.txtMonth = "MM",
    this.txtTitle = "Title",
    this.txtSubTitle = "SubTitle",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ViewMyRichText(
            text1: txtMonth.toUpperCase(),
            text2: txtYear,
          ),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: AppColors.primaryLight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    txtTitle,
                    style: AppTextStyle.headline6(
                        txtColor: AppColors.primary, wFont: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    txtSubTitle,
                    style: AppTextStyle.subtitle1(
                        txtColor: AppColors.greyDark, wFont: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
