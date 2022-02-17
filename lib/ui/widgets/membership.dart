import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';

class TemplateMembership extends StatefulWidget {
  final String txtTitle;
  final String txtSubTitle;
  final String txtCaption;

  final Color checkColor;
  final Color borderColor;

  // final Function() onTabSelected;

  const TemplateMembership(
      {Key? key,
      this.txtTitle = "Title",
      this.txtSubTitle = "SubTitle",
      this.txtCaption = "Caption",
      this.checkColor = AppColors.primary,
      this.borderColor = AppColors.grey,
      // required this.onTabSelected,
      })
      : super(key: key);

  @override
  State<TemplateMembership> createState() => _TemplateMembershipState();
}

class _TemplateMembershipState extends State<TemplateMembership> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.primaryLightest,
            border: Border.all(color: AppColors.grey)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.greyLightest)),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.txtTitle,
                    style: AppTextStyle.subtitle1(txtColor: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.txtSubTitle,
                    style:
                        AppTextStyle.captionRF1(txtColor: AppColors.greyDark),
                  ),
                ],
              ),
            ),
            Text(
              widget.txtCaption,
              style: AppTextStyle.headline6(txtColor: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
