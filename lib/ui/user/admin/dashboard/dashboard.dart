import 'package:doctor_consultation/ui/user/admin/dashboard/patient_profile_page.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/schedule_history_page.dart';
import 'package:doctor_consultation/ui/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';
import 'message_page.dart';
import 'package:doctor_consultation/route/route.dart' as route;

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
              ],
            )),
            BottomNav(
              selectedTab: _selectedTab,
              tabPressed: (num) {
                switch (num) {
                  /* case 2:
                    {
                      Navigator.pushNamed(context, route.patientsMessages);
                    }
                    break;*/
                  case 3:
                    {
                      Navigator.pushNamed(context, route.drProfilePage);
                    }
                    break;
                  default:
                    {
                      _tabsPageController.animateToPage(num,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic);
                    }
                }
              },
              onActionBtnClicked: () {
                Navigator.pushNamed(context, route.manageSlots);
              },
            ),
          ],
        ),
      ),
    );
  }
}
