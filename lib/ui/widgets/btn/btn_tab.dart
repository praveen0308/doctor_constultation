import 'package:doctor_consultation/res/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BtnTabView extends StatelessWidget {
  final String txtTab1;
  final String txtTab2;
  final String txtTab3;
  final Function(int index)? onSwitched;
  const BtnTabView(
      {Key? key,
      this.txtTab1 = "Tab1",
      this.txtTab2 = "Tab2",
      this.txtTab3 = "Tab3",
      this.onSwitched})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              //Main Tab Outline Color
              border: Border.all(color: AppColors.primary, width: 1),

              //Main Tab Background Color
              color: AppColors.greyLightest,

              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TabBar(
              onTap: onSwitched,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(25.0),
              ),
              labelColor: AppColors.greyLightest,
              unselectedLabelColor: AppColors.primary,
              tabs: [
                Tab(text: txtTab1),
                Tab(text: txtTab2),
                Tab(text: txtTab3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
