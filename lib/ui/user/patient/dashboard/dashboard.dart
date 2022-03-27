import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/repository/util_repository.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/appointment_history/patient_appointment_history.dart';
import 'package:doctor_consultation/ui/widgets/bottom_nav_bar/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation/route/route.dart' as route;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page/home_page.dart';
import 'home_page/home_page_cubit.dart';

class DashboardPatient extends StatefulWidget {
  const DashboardPatient({Key? key}) : super(key: key);

  @override
  _DashboardPatientState createState() => _DashboardPatientState();
}

class _DashboardPatientState extends State<DashboardPatient> {
  late PageController _tabsPageController;
  int _selectedTab = 0;
  final _storage = SecureStorage();
  bool isVisible = false;

  @override
  void initState() {
    _tabsPageController = PageController();
    _storage.getUserRoleId().then((value) => {
          if (value == UserRoles.registeredPatient)
            {
              setState(() {
                isVisible = true;
              })
            }
        });
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
                BlocProvider(
                  create: (context) => HomePageCubit(UtilRepository()),
                  child: HomePage(),
                ),
                PatientAppointmentHistory(),
              ],
            )),
            Visibility(
              visible: isVisible,
              child: BottomNav(
                selectedTab: _selectedTab,
                tabPressed: (num) {
                  switch (num) {
                    case 2:
                      {
                        Navigator.pushNamed(context, route.messagePage);
                      }
                      break;
                    case 3:
                      {
                        Navigator.pushNamed(context, route.patientProfilePage);
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
                  Navigator.pushNamed(context, route.addNewAppointment);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
