import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/material.dart';

import '../../models/api/schedule_model.dart';

enum ChipGroupType { single, multiple }

class CustomChipGroup extends StatefulWidget {
  final List<ScheduleModel> data;
  final ChipGroupType type;

  /// This will return whole data list
  final Function(List<ScheduleModel> data) onSubmitted;

  /// This will return latest selected item
  final Function(ScheduleModel data) onItemSelected;

  const CustomChipGroup({
    Key? key,
    required this.data,
    this.type = ChipGroupType.single,
    required this.onItemSelected,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  _CustomChipGroupState createState() => _CustomChipGroupState();
}

class _CustomChipGroupState extends State<CustomChipGroup> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: widget.data.isNotEmpty
            ? Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  widget.data.length, //length
                  (index) => SlotView(
                      index: index,
                      title: widget.data[index].getTiming(),
                      onTap: (index, status) {
                        if (widget.type == ChipGroupType.single) {
                          for (var element in widget.data) {
                            element.IsAvailable = false;
                          }
                        }
                        widget.data[index].IsAvailable = status;
                        widget.onItemSelected(widget.data[index]);
                        widget.onSubmitted(widget.data);
                        setState(() {});
                      },
                      isSelected: widget.data[index].IsAvailable!),
                ))
            : Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: AppColors.errorLightest,
                  border: Border.all(color: AppColors.errorDark),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "No available slots today !!!",
                    style: AppTextStyle.headline6(),
                  ),
                ),
              ));
  }
}

class SlotView extends StatelessWidget {
  final String title;
  final Function(int index, bool isSelected) onTap;
  final bool isSelected;
  final int index;

  const SlotView(
      {Key? key,
      required this.index,
      required this.title,
      required this.onTap,
      required this.isSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: InkWell(
        onTap: () {
          onTap(index, !isSelected);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
              color: isSelected ? AppColors.primary : AppColors.greyLightest,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color:
                      isSelected ? AppColors.greyLightest : AppColors.primary)),
          child: Text(
            title,
            style: AppTextStyle.captionOF2(
                txtColor:
                    isSelected ? AppColors.greyLightest : AppColors.primary),
          ),
        ),
      ),
    );
  }
}
