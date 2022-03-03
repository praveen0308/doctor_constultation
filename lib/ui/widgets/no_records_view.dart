import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoRecordsView extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;
  final bool requiredBtn;
  final String btnText;
  final Function() onBtnClick;

  const NoRecordsView(
      {Key? key,
      this.imgUrl = AppImages.imgNotAvailable,
      required this.title,
      this.subtitle = "",
      this.btnText = "okay",
      required this.onBtnClick,
      this.requiredBtn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24,),
          SvgPicture.asset(
            imgUrl,
            height: 200,
          ),
          const SizedBox(height: 16,),
          Text(
            title,
            style: AppTextStyle.headline5(),
          ),
          const SizedBox(height: 16,),
          Text(
            subtitle,
            style: AppTextStyle.overlieOF4(),
          ),
          Spacer(),

          Visibility(
            visible: requiredBtn,
            child: CustomBtn(
                title: btnText, onBtnPressed: () { onBtnClick();}, isLoading: false),
          ),
        ],
      ),
    );
  }
}
