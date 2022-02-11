import 'package:doctor_consultation/doctor/dr_profile.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/user/admin/appointment/patient_past_appointment_detail.dart';
import 'package:doctor_consultation/user/patient/notification/patient_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppNavBar extends StatelessWidget {
  final String txtAddress;

  const AppNavBar({
    Key? key,
    this.txtAddress = "Current Location",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.greyLightest,
      leading: IconButton(
        // icon: Image.asset(AppImages.drPriyanka,),
        // onPressed: () { },

        icon: const CircleAvatar(
          backgroundImage: AssetImage(AppImages.drPriyanka),
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => DrProfilePage())),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          const Spacer(
            flex: 4,
          ),
          SizedBox(
            child: SvgPicture.asset(AppImages.icLocationPrimary),
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            txtAddress,
            style: TextStyle(color: AppColors.greyDark, fontSize: 16),
          ),
          const SizedBox(
            width: 4,
          ),
          SizedBox(
            child: SvgPicture.asset(AppImages.icArrowDown),
            height: 15,
            width: 10,
          ),
          const Spacer(
            flex: 6,
          ),
          IconButton(
              icon: SvgPicture.asset(AppImages.icNotificationPrimary),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationPage()))),
        ],
      ),
    );
  }
}
