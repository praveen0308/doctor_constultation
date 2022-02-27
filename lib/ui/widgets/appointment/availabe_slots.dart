import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_tab.dart';
import 'package:doctor_consultation/ui/widgets/btn/view_timing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../btn/btn_outline_tab.dart';

class TemplateAvailableSlot extends StatefulWidget {
  final int index;

  const TemplateAvailableSlot({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  State<TemplateAvailableSlot> createState() => _TemplateAvailableSlotState();
}

class _TemplateAvailableSlotState extends State<TemplateAvailableSlot> {
  bool _isSelected = false;
  List<String> mList = [
    "09:00 am",
    "09:30 am",
    "10:00 am",
    "10:30 am",
    "11:00 am",
    "11:30 am",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Available Slots".toUpperCase(),
              style: AppTextStyle.captionRF1(),
            ),
            const SizedBox(
              height: 10,
            ),
            BtnTabView(
                txtTab1: "Morning", txtTab2: "Afternoon", txtTab3: "Evening"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    6, //length
                    (index) => ViewTiming(
                      slotModel: SlotModel(),
                      onClick: (slot) {},
                    ),
                  )),
            )
          ],
        ));
  }
}
