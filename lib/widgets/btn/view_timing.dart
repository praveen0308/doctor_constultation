import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewTiming extends StatefulWidget {
  final String txtTiming;

  const ViewTiming({
    Key? key,
    this.txtTiming = "Timing",
  }) : super(key: key);

  @override
  _ViewTimingState createState() => _ViewTimingState();
}

class _ViewTimingState extends State<ViewTiming> {
    bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: InkWell(
        onTap: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 40,
          decoration: BoxDecoration(
              color: _isSelected ? AppColors.primary : AppColors.greyLightest,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: _isSelected
                      ? AppColors.greyLightest
                      : AppColors.primary)),
          child: Text(widget.txtTiming.toUpperCase(),
            style: AppTextStyle.captionOF2(
                txtColor:
                    _isSelected ? AppColors.greyLightest : AppColors.primary),
          ),
        ),
      ),
    );
  }
}
