import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class AppNavBar extends StatefulWidget {
  final String txtAddress;

  const AppNavBar({
    Key? key,
    this.txtAddress = "Current Location",
  }) : super(key: key);

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  final _storage = SecureStorage();
  int roleId = 0;
  @override
  void initState() {
    super.initState();
    _storage.getUserRoleId().then((value) {
      setState(() {
        roleId = value;
      });});
  }

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
        onPressed: () => Navigator.pushNamed(context, route.drProfilePage),
      ),
      title: Row(

        children: <Widget>[
          const Spacer(),
          Visibility(
            visible: false,
            child: Row(
              children: [
                SizedBox(
                  child: SvgPicture.asset(AppImages.icLocationPrimary),
                  height: 20,
                  width: 20,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  widget.txtAddress,
                  style: const TextStyle(color: AppColors.greyDark, fontSize: 16),
                ),
                const SizedBox(
                  width: 4,
                ),
                SizedBox(
                  child: SvgPicture.asset(AppImages.icArrowDown),
                  height: 15,
                  width: 10,
                ),
              ],
            ),
          ),
          Visibility(
            visible: roleId!=UserRoles.nonRegisteredPatient,
            child: IconButton(
              icon: SvgPicture.asset(AppImages.icNotificationPrimary),
              onPressed: () =>
                  Navigator.pushNamed(context, route.notificationPage),
            ),
          ),
        ],
      ),
    );
  }
}
