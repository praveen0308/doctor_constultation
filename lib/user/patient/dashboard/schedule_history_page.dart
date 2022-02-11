import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/widgets/btn/btn_tab.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/widgets/template_schedule_detail.dart';
import 'package:doctor_consultation/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';

class ScheduleHistoryPage extends StatefulWidget {
  const ScheduleHistoryPage({Key? key}) : super(key: key);

  @override
  _ScheduleHistoryPageState createState() => _ScheduleHistoryPageState();
}

class _ScheduleHistoryPageState extends State<ScheduleHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNavBar(
              txtAddress: "Jari Mari, Sakinaka",
            ),
            Text(
              "Let's check",
              style: AppTextStyle.headline6(txtColor: AppColors.primary),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Your Schedule",
              style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
            ),
            const SizedBox(
              height: 10,
            ),
            const BtnTabView(txtTab1: "Upcoming",txtTab2: "Completed",txtTab3: "Canceled",),
            const SizedBox(
              height: 10,
            ),

            ViewMyRichText(
              text1: "Nearest",
              text2: " Visit",
              txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
            ),
            const SizedBox(
              height: 10,
            ),
            TemplateScheduleDetail(),
            const SizedBox(
              height: 20,
            ),
            ViewMyRichText(
              text1: "Future",
              text2: " Visit",
              txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
            ),

            const SizedBox(
              height: 20,
            ),
            TemplateScheduleDetail(),
            const SizedBox(
              height: 20,
            ),
            TemplateScheduleDetail(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
