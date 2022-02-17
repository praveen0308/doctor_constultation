import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewInfoChipWithIcon extends StatefulWidget {
  final Color bgColor;
  final Color txtColor;
  final String title;
  final String imgUrl;
  final Function()? onMyTab;

  const ViewInfoChipWithIcon({
    Key? key,
    this.bgColor = AppColors.primaryLight,
    this.txtColor = AppColors.primaryDark,
    this.title = "Title",
    this.imgUrl = AppImages.icUnMuteVideoCall,
    this.onMyTab,
  }) : super(key: key);

  @override
  State<ViewInfoChipWithIcon> createState() => _ViewInfoChipWithIconState();
}

class _ViewInfoChipWithIconState extends State<ViewInfoChipWithIcon> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: InkWell(
        onTap: () => widget.onMyTab!(),
        child: Container(
          alignment: AlignmentDirectional.center,
          height: 25,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(widget.imgUrl,height: 10,color: widget.txtColor,),
              const SizedBox(
                width: 5,
              ),
              Text(
                  widget.title,
                  style: AppTextStyle.captionRF2(
                    txtColor: widget.txtColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
