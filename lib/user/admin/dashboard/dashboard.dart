import 'package:doctor_consultation/user/admin/dashboard/home_page.dart';
import 'package:doctor_consultation/user/admin/dashboard/message_page.dart';
import 'package:doctor_consultation/user/admin/dashboard/patient_profile_page.dart';
import 'package:doctor_consultation/user/admin/dashboard/schedule_history_page.dart';
import 'package:doctor_consultation/user/patient/communication/chat_with_doctor/main_chat.dart';
import 'package:doctor_consultation/user/patient/dashboard/home_page.dart';
import 'package:doctor_consultation/user/patient/dashboard/patient_profile_page.dart';
import 'package:doctor_consultation/user/patient/dashboard/schedule_history_page.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardAdmin extends StatefulWidget {
  const DashboardAdmin({Key? key}) : super(key: key);

  @override
  _DashboardAdminState createState() => _DashboardAdminState();
}

class _DashboardAdminState extends State<DashboardAdmin> {
  late PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // const AppNavBar(
            //   txtAddress: "Marine Line, Mumbai",
            // ),
            Expanded(
                child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                DoctorHomePage(),
                DoctorScheduleHistoryPage(),
                DoctorMessagePage(),
                DoctorProfilePage(),
              ],
            )),
            BottomNav(
              selectedTab: _selectedTab,
              tabPressed: (num) {
                _tabsPageController.animateToPage(num,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic);
              },
            ),
          ],
        ),
      ),
    );
  }
}
