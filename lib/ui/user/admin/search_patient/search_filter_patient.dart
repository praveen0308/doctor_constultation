import 'package:doctor_consultation/widgets/app_nav_bar/app_back_search_bar.dart';
import 'package:doctor_consultation/widgets/btn/search_patient_filter.dart';
import 'package:doctor_consultation/widgets/patient/alpha_patient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutSearchFilterPatient extends StatelessWidget {
  const LayoutSearchFilterPatient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AppBackSearchNavBar(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TemplateAlphaPatient(),
                ),
              ],
            )

          ],
        )
      ),
    ),);
  }
}
