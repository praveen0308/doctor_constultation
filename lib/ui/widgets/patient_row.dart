import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/material.dart';

class PatientRow extends StatelessWidget {
  final String? name;
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
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Center(
                child: Text(
                  name ?? " ".substring(0, 1),
                  style: AppTextStyle.headline6(),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Text(
              name ?? "N.A.",
              style: AppTextStyle.headline5(),
            ))
          ],
        ),
      ),
    );
  }
}
