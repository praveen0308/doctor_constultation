import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class BottomNav extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;
  final Function() onActionBtnClicked;

  const BottomNav(
      {Key? key,
      required this.selectedTab,
      required this.tabPressed,
      required this.onActionBtnClicked})
      : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab;

    return Container(
      height: 60,
      child: Stack(children: [
        Column(
          children: [
            const Spacer(),
            SizedBox(
              height: 60,
              child: Container(
                decoration:
                    BoxDecoration(color: AppColors.greyLightest, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 1.0,
                    blurRadius: 30.0,
                  )
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomTabBtn(
                      imagePath: AppImages.icHome,
                      label: "Home",
                      selected: _selectedTab == 0 ? true : false,
                      onPressed: () {
                        widget.tabPressed(0);
                      },
                    ),
                    BottomTabBtn(
                      imagePath: AppImages.icSchedule,
                      label: "Schedule",
                      selected: _selectedTab == 1 ? true : false,
                      onPressed: () {
                        widget.tabPressed(1);
                      },
                    ),
                    const SizedBox(
                      width: 56,
                    ),
                    BottomTabBtn(
                        imagePath: AppImages.icMessage,
                        label: "Message",
                        selected: _selectedTab == 2 ? true : false,
                        onPressed: () {
                          widget.tabPressed(2);
                          // Navigator.pushNamed(context, route.messagePage),
                        }),
                    BottomTabBtn(
                      imagePath: AppImages.icUserProfile,
                      label: "Profile",
                      selected: _selectedTab == 3 ? true : false,
                      onPressed: () {
                        widget.tabPressed(3);
                        // Navigator.pushNamed(context, route.patientProfilePage)
                      }, //SlidingUpPanelExample()
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          InkWell(
            onTap: () {
              widget.onActionBtnClicked();
            },
            borderRadius: BorderRadius.circular(28),
            child: Container(
                height: 56,
                width: 56,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.greyLight, width: 4),
                  color: AppColors.primary,
                ),
                child: SvgPicture.asset(
                  AppImages.icAddAppointment,
                  color: AppColors.greyLightest,
                )),
          )
        ])
      ]),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final String imagePath;
  final String label;
  final bool selected;
  final Function() onPressed;

  const BottomTabBtn(
      {Key? key,
      required this.imagePath,
      required this.label,
      required this.selected,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: selected ? AppColors.primary : AppColors.greyLightest,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: SizedBox(
              width: 24,
              height: 24,
              child: SvgPicture.asset(
                imagePath,
                color: selected ? AppColors.greyLightest : AppColors.primary,
              ))),
    );
  }
}
