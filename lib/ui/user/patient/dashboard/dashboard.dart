import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/ui/user/patient/communication/chat_with_doctor/main_chat.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/patient_profile_page.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/schedule_history_page.dart';
import 'package:doctor_consultation/ui/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class DashboardPatient extends StatefulWidget {
  const DashboardPatient({Key? key}) : super(key: key);

  @override
  _DashboardPatientState createState() => _DashboardPatientState();
}

class _DashboardPatientState extends State<DashboardPatient> {
  late PageController _tabsPageController;
  int _selectedTab = 0;
  final _storage = SecureStorage();

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
            // const AppNavBar(),
            Expanded(
                child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                HomePage(),
                ScheduleHistoryPage(),
                MainChatPage(),
                PatientProfilePage(),
              ],
            )),
            Visibility(
              visible: _storage.getUserRoleId() == UserRoles.registeredPatient,
              child: BottomNav(
                selectedTab: _selectedTab,
                tabPressed: (num) {
                  _tabsPageController.animateToPage(num,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeOutCubic);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
