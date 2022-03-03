import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlotView extends StatelessWidget {
  final int id;
  final String title;
  final bool isBooked;
  final bool isAvailable;
  final bool isSelected;
  final Function(int id) onClick;

  const SlotView({
    Key? key,
    required this.onClick,
    required this.id,
    required this.title,
    required this.isBooked,
    required this.isAvailable,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.contain,
          child: InkWell(
            onTap: () {
              // Slot should be available and not booked then only user can click on view
              if (isAvailable && !isBooked) {
                onClick(id);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.primary : AppColors.greyLightest,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                      color: isSelected
                          ? AppColors.greyLightest
                          : AppColors.primary)),
              child: Text(
                title,
                style: AppTextStyle.captionOF2(
                    txtColor: isSelected
                        ? AppColors.greyLightest
                        : AppColors.primary),
              ),
            ),
          ),
        ),
        if (isBooked)
          Text(
            "Booked",
            style: AppTextStyle.captionOF2(txtColor: AppColors.primary),
          )
      ],
    );
  }
}
