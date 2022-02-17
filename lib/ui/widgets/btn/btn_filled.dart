import 'package:doctor_consultation/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnFilled extends StatelessWidget {
  final String title;
  final Function()? onBtnPressed;

  const BtnFilled({Key? key, this.title = "Filled", this.onBtnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      textColor: Colors.white,
      color: AppColors.primary,
      child: Text(
        title.toUpperCase(),
      ),
      onPressed: () => onBtnPressed!(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
