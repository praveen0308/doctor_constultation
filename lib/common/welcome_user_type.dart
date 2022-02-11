import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/user/admin/dashboard/dashboard.dart';
import 'package:doctor_consultation/user/patient/dashboard/dashboard.dart';
import 'package:doctor_consultation/widgets/select_consulation.dart';
import 'package:doctor_consultation/widgets/select_user_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutUserType extends StatelessWidget {
  const LayoutUserType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TemplateSelectUserType(
                        imgURL: AppImages.icDoctor,
                        txtTitle: "I'm Doctor",
                        navPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashboardAdmin()));
                        },
                      ),
                      TemplateSelectUserType(
                        txtTitle: "I'm Patient",
                        imgURL: AppImages.icUserProfile,
                        navPress: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardPatient()));
                        },
                      ),
                      TemplateSelectUserType(
                        txtTitle: "I'm Doctor",
                        navPress: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
