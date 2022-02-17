import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class EditUserImage extends StatelessWidget {
  const EditUserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: AppColors.primaryLight,
                blurRadius: 30.0,
              ),
            ],
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(AppImages.imgAvatar),
          ),
        ),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  // boxShadow: [
                  //   new BoxShadow(
                  //     color: AppColors.primaryLight,
                  //     blurRadius: 20.0,
                  //   ),
                  // ],
                  borderRadius: BorderRadius.circular(15)),
            ),
            SizedBox(
              height: 15,
              child: SvgPicture.asset(
                AppImages.icEditImage,
                color: AppColors.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
