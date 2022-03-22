import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateMembership extends StatefulWidget {
  final int mIndex;
  final String? txtTitle;
  final String? txtSubTitle;
  final String? txtCaption;

  final Color checkColor;
  final Color borderColor;
  final bool selectionEnabled;
  final bool isSelected;
  final Function(int index) onSelected;

  // final Function() onTabSelected;

  const TemplateMembership(
      {Key? key,
      required this.mIndex,
      this.txtTitle = "Title",
      this.txtSubTitle = "SubTitle",
      this.txtCaption = "Caption",
      this.checkColor = AppColors.primary,
      this.borderColor = AppColors.grey,
      this.selectionEnabled = false,
      this.isSelected = false,
      required this.onSelected})
      : super(key: key);

  @override
  State<TemplateMembership> createState() => _TemplateMembershipState();
}

class _TemplateMembershipState extends State<TemplateMembership> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onSelected(widget.mIndex);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.primaryLightest,
            border: Border.all(color: AppColors.grey)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: widget.selectionEnabled,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.primary, width: 2)),
                child: Visibility(
                    visible: widget.isSelected,
                    child: const Icon(
                      Icons.circle,
                      color: AppColors.primary,
                      size: 18,
                    )),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.txtTitle ?? "N.A.",
                    style: AppTextStyle.subtitle1(txtColor: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.txtSubTitle ?? "N.A.",
                    style:
                        AppTextStyle.captionRF1(txtColor: AppColors.greyDark),
                  ),
                ],
              ),
            ),
            Text(
              "₹${widget.txtCaption}",
              style: AppTextStyle.headline6(txtColor: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
