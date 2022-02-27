import 'package:doctor_consultation/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String title;
  final Function() onBtnPressed;
  final bool isLoading;
  final bool isOutlined;

  const CustomBtn(
      {Key? key,
      required this.title,
      required this.onBtnPressed,
      required this.isLoading,
      this.isOutlined = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: !isLoading,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              textColor: Colors.white,
              color: AppColors.primary,
              child: Text(
                title.toUpperCase(),
              ),
              onPressed: () => onBtnPressed(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isLoading,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        )
      ],
    );
  }
}
