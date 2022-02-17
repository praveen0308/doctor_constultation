import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ViewPatientReview extends StatelessWidget {
  const ViewPatientReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: AppColors.greyLightest,
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(AppImages.imgAvatar),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Mr. Sunil Yadav",
                          style: AppTextStyle.subtitle1(),

                        ),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.primaryLight,
                              borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              SizedBox(
                                child: SvgPicture.asset(
                                  AppImages.icStarFill,
                                  color: AppColors.primary,
                                ),
                                height: 15,
                                width: 15,
                              ),
                              Text("4.7", style: AppTextStyle.captionRF2()),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Text(
                        "3 days ago",
                        style: AppTextStyle.captionRF2(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "))
        ],
      ),
    );
  }
}
