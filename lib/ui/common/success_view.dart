import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class SuccessPageArgs {
  final ScheduleModel scheduleModel;
  final int patientId;
  final int appointmentId;

  SuccessPageArgs(
      {required this.scheduleModel,
      required this.patientId,
      required this.appointmentId});
}

class SuccessPage extends StatelessWidget {
  final SuccessPageArgs args;

  const SuccessPage({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60.0 / 4 * 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppImages.imgSuccessfullyDone),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Thank you for Appoinment Booking!",
                style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '''You booked an appoinment with \n Dr. Priyanaka Yaduwanshi \n on ${DateFormat("dd MMMM, yyyy").format(DateTime.parse(args.scheduleModel.ScheduleDate!))} at ${args.scheduleModel.getFStartTime()}''',
                textAlign: TextAlign.center,
                style: AppTextStyle.overlieOF1(txtColor: AppColors.greyBefore),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: BtnOutline(
                        title: "Go to Home",
                        onBtnPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: BtnFilled(
                          title: "Add Case Info",
                          onBtnPressed: () {
                            Navigator.pushNamed(context, "/addCaseInfo",
                                arguments: AddCaseInfoArgs(
                                    args.patientId, args.appointmentId));
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
