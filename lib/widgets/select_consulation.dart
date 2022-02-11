import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateSelectConsultation extends StatefulWidget {
  final String imgURL;
  final String txtTitle;
  final String txtSubTitle;
  final Color bgColor;
  final Color outColor;
  final Color txtColor;
  final double sCard;

  const TemplateSelectConsultation({
    Key? key,
    this.imgURL = AppImages.icVoiceCall,
    this.txtTitle = "Title",
    this.txtSubTitle = "SubTitle",
    this.bgColor = AppColors.primary,
    this.outColor = AppColors.primary,
    this.txtColor = AppColors.greyLightest,
    this.sCard = 110,
  }) : super(key: key);

  @override
  State<TemplateSelectConsultation> createState() => _TemplateSelectConsultationState();
}

class _TemplateSelectConsultationState extends State<TemplateSelectConsultation> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    double sHeight = widget.sCard;
    double sWidth = sHeight / 2 + 50;
    return FittedBox(
      fit: BoxFit.contain,
      child: InkWell(
        onTap: (){
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Container(
          padding: const EdgeInsets.only(top: 15),
          height: sHeight,
          width: sWidth,
          decoration: BoxDecoration(
              border: Border.all(color: _isSelected ? AppColors.greyLightest:AppColors.primary),
              borderRadius: BorderRadius.circular(10),
              color: _isSelected ? AppColors.primary : AppColors.greyLightest),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                widget.imgURL,
                color: _isSelected ? AppColors.greyLightest:AppColors.primary,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.txtTitle,
                style: AppTextStyle.subtitle2(txtColor: _isSelected ? AppColors.greyLightest:AppColors.primary),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.txtSubTitle,
                style: AppTextStyle.subtitle2(txtColor: _isSelected ? AppColors.greyLightest:AppColors.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
