import 'package:doctor_consultation/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnOutline extends StatelessWidget {
  final String title;
  final Function()? onBtnPressed;
  final bool? isLoading;
  const BtnOutline({Key? key,this.title = "Outline", this.onBtnPressed, this.isLoading=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MaterialButton(
          height: 50,
          color: AppColors.greyLightest,
          onPressed: () => onBtnPressed!(),
          child: Text(title.toUpperCase(), style: const TextStyle(
              color: AppColors.primary
          )
          ),
          textColor: AppColors.greyLightest,

          shape: RoundedRectangleBorder(side: const BorderSide(
              color: AppColors.primary,
              width: 1,
              style: BorderStyle.solid
          ), borderRadius: BorderRadius.circular(50)),
        ),
        Visibility(visible: isLoading??false,child: const CircularProgressIndicator())
      ],
    );
  }
}
