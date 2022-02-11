import 'package:doctor_consultation/res/app_colors.dart';
import 'package:flutter/cupertino.dart';

class ViewBullet extends StatelessWidget {
  const ViewBullet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();Container(
      height: 20.0,
      width: 20.0,
      decoration: new BoxDecoration(
        color: AppColors.greyDark,
        shape: BoxShape.circle,
      ),
    );
  }
}
