import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnOutlineTabView extends StatefulWidget {
  final Function(int index) onTabSelected;

  // final Color unSelectColor;
  // final Color selectColor;
  final String txtTab1;
  final String txtTab2;
  final String txtTab3;

  const BtnOutlineTabView({Key? key, required this.onTabSelected, this.txtTab1 = "", this.txtTab2 = "", this.txtTab3 = ""}) : super(key: key);

  @override
  State<BtnOutlineTabView> createState() => _BtnOutlineTabViewState();
}

class _BtnOutlineTabViewState extends State<BtnOutlineTabView> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Container(
            height: 45,
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
              onTap: (index){
                setState(() {
                  _index = index;
                });

                widget.onTabSelected(_index);
              },
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: _index ==1 || _index == 2 ? AppColors.primary:AppColors.primary, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(widget.txtTab1),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: _index ==0 || _index == 2  ? AppColors.primary:AppColors.primary, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(widget.txtTab2),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: _index ==0 || _index == 1 ? AppColors.primary:AppColors.primary, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(widget.txtTab3),
                    ),
                  ),
                ),
              ],
            )));
  }
}
