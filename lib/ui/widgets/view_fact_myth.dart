import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';


class ViewFactMyth extends StatelessWidget {
  final String title;
  final String subTitle;
  const ViewFactMyth({Key? key, this.title = "Title", this.subTitle="Sub Title"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Myth: ", style: AppTextStyle.captionRF2()),
              TextSpan(
                  text: title,
                  style: AppTextStyle.captionRF1()),
            ]),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: "Fact: ", style: AppTextStyle.captionRF2()),
              TextSpan(
                  text: subTitle,
                  style: AppTextStyle.captionRF1()),
              // TextSpan(
              //     text: " Read more", style: AppTextStyle.captionRF3())
            ]),
          ),

        ],
      ),
    );
  }
}
