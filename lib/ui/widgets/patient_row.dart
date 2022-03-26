import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/material.dart';

class PatientRow extends StatelessWidget {
  final String name;
  final Function() onRowClick;
  const PatientRow({Key? key, required this.name, required this.onRowClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onRowClick();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.greyDark,
              radius: 16,
              child: Center(
                child: Text(
                  name.substring(0, 1),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Text(
              name,
              style: AppTextStyle.subtitle1(txtColor: AppColors.primary),
            ))
          ],
        ),
      ),
    );
  }
}
