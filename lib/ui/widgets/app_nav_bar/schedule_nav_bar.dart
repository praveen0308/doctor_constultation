import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class ScheduleNavBar extends StatelessWidget {
  final String txtAddress;

  const ScheduleNavBar({
    Key? key,
    this.txtAddress = "Current Location",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.greyLightest,
      leading: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: IconButton(
          // icon: Image.asset(AppImages.drPriyanka,),
          // onPressed: () { },

          icon: const CircleAvatar(
            backgroundImage: AssetImage(AppImages.drPriyanka),
          ),
          onPressed: () => Navigator.pushNamed(context, route.drProfilePage),
        ),
      ),
      title: Row(

        children: <Widget>[
          const Spacer(
            flex: 5,
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
            flex: 2,
          ),
          IconButton(
            icon: SvgPicture.asset(AppImages.icNotificationPrimary),
            onPressed: () => Navigator.pushNamed(context, route.notificationPage)
          ),
          IconButton(
            icon: SvgPicture.asset(AppImages.icNavPastAppointmentPrimary),
            onPressed: () => Navigator.pushNamed(context, route.layoutPastAppointment)
          ),
        ],
      ),
    );
  }
}
