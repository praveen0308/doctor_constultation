import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/util_repository.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/appointment_history/doctor_appointment_history_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/patient_profile_page.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/appointment_history/doctor_appointment_history.dart';
import 'package:doctor_consultation/ui/user/admin/home_page/home_page_cubit.dart';
import 'package:doctor_consultation/ui/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../communication/chat/message_page.dart';
import '../home_page/home_page.dart';

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
    super.initState();
    _tabsPageController = PageController();

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
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabsPageController,
              onPageChanged: (num) {
                setState(() {
                  _selectedTab = num;
                });
              },
              children: [
                BlocProvider(
                  create: (context) => HomePageCubit(AppointmentRepository(),UtilRepository()),
                  child: DoctorHomePage(),
                ),
                BlocProvider(
                  create: (context) =>
                      DoctorAppointmentHistoryCubit(AppointmentRepository()),
                  child: DoctorAppointmentHistory(),
                ),
                DoctorMessagePage(),
              ],
            )),
            BottomNav(
              selectedTab: _selectedTab,
              requiredActionBtn: false,
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
