import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewTiming extends StatefulWidget {
  final SlotModel slotModel;
  final Function(SlotModel slotModel) onClick;

  const ViewTiming({
    Key? key,
    required this.slotModel,
    required this.onClick,
  }) : super(key: key);

  @override
  _ViewTimingState createState() => _ViewTimingState();
}

class _ViewTimingState extends State<ViewTiming> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: InkWell(
        onTap: () {
          setState(() {
            widget.slotModel.IsAvailable = !widget.slotModel.IsAvailable!;
            widget.onClick(widget.slotModel);
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
              color: widget.slotModel.IsAvailable!
                  ? AppColors.primary
                  : AppColors.greyLightest,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: widget.slotModel.IsAvailable!
                      ? AppColors.greyLightest
                      : AppColors.primary)),
          child: Text(
            widget.slotModel.getTiming(),
            style: AppTextStyle.captionOF2(
                txtColor: widget.slotModel.IsAvailable!
                    ? AppColors.greyLightest
                    : AppColors.primary),
          ),
        ),
      ),
    );
  }
}
