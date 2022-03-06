import 'package:doctor_consultation/models/action_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/material.dart';

import 'btn/btn_circle.dart';

class QuickActionItem extends StatelessWidget {
  final ActionModel actionModel;
  final Function(AppNavActions action) onClick;

  const QuickActionItem({Key? key, required this.actionModel, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClick(actionModel.action);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        child: Column(
          children: [
            BtnCircle(
              tabPressed: () {
                onClick(actionModel.action);
              },
              iconImage: actionModel.icon,
              iconColor: AppColors.primary,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                actionModel.title,
                style: AppTextStyle.captionRF2(
                    txtColor: AppColors.greyDark, wFont: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
