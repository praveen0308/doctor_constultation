import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientChatRow extends StatelessWidget {
  final String patientName;
  final String msg;
  final DateTime? timeStamp;
  final VoidCallback onTap;
  const PatientChatRow(
      {Key? key,
      required this.patientName,
      required this.msg,
      required this.timeStamp,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColors.primaryLight))),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              child: Center(child: Text(patientName.substring(0, 1))),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  patientName,
                  style: AppTextStyle.subtitle1(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(msg),
                    if (timeStamp != null)
                      Text(DateFormat.jm().format(timeStamp!)),
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
