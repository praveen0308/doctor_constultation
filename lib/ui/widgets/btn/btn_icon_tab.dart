import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnIconTabView extends StatefulWidget {
  final Function(int index) onTabSelected;

  const BtnIconTabView({Key? key, required this.onTabSelected})
      : super(key: key);

  @override
  State<BtnIconTabView> createState() => _BtnIconTabViewState();
}

class _BtnIconTabViewState extends State<BtnIconTabView> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          //Main Tab Outline Color
          // border:Border.all(color: AppColors.primary, width: 1),

          //Main Tab Background Color
          // color: AppColors.greyLightest,

          borderRadius: BorderRadius.circular(25.0),
        ),
        child: TabBar(
          unselectedLabelColor: AppColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.primary),
          onTap: (index) {
            setState(() {
              _index = index;
            });

            widget.onTabSelected(_index);
          },
          tabs: [
            Tab(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.primary, width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.icClinic,
                          color: _index == 0
                              ? AppColors.greyLightest
                              : AppColors.primary),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("Clinic"),
                    ],
                  ),
                ),
              ),
            ),
            Tab(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.primary, width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.icOnlineConsult,
                          color: _index == 1
                              ? AppColors.greyLightest
                              : AppColors.primary),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("Online"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
