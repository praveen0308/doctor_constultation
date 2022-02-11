import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnCircle extends StatefulWidget {
  final Color bgColor;
  final Color sColor;
  final Color iconColor;
  final String iconImage;
  final double iconSize;
  final Function() tabPressed;

  const BtnCircle({Key? key,
    this.bgColor = AppColors.primaryLightest,
    this.sColor = AppColors.primaryLight,
    this.iconColor = AppColors.primary,
    this.iconImage = AppImages.icVoiceCall,
    this.iconSize = 20,
    required this.tabPressed
  }) : super(key: key);

  @override
  State<BtnCircle> createState() => _BtnCircleState();
}

class _BtnCircleState extends State<BtnCircle> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return ClipOval(

      child: Material(

        color: widget.bgColor, // Button color
        child: InkWell(
          splashColor: widget.sColor, // Splash color
          onTap: () {
            widget.tabPressed();
          },
          child: Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.all(widget.iconSize),
            child: SizedBox(
                width: widget.iconSize, height: widget.iconSize, child: SvgPicture.asset(widget.iconImage, color:widget.iconColor)),
          ),
        ),
      ),
    );
  }
}
