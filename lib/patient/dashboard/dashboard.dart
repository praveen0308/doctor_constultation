import 'package:doctor_consultation/patient/dashboard/home_page.dart';
import 'package:doctor_consultation/patient/dashboard/message_page.dart';
import 'package:doctor_consultation/patient/dashboard/patient_profile_page.dart';
import 'package:doctor_consultation/patient/dashboard/schedule_history_page.dart';
import 'package:doctor_consultation/widgets/app_nav_bar.dart';
import 'package:doctor_consultation/widgets/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPatient extends StatefulWidget {
  const DashboardPatient({Key? key}) : super(key: key);

  @override
  _DashboardPatientState createState() => _DashboardPatientState();
}

class _DashboardPatientState extends State<DashboardPatient> {
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
            const AppNavBar(),
            Expanded(
                child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                HomePage(),
                MessagePage(),
                ScheduleHistoryPage(),
                PatientProfilePage(),
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
