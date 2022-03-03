import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/ui/widgets/schedule/temp_date.dart';
import 'package:doctor_consultation/ui/widgets/template_ic_text1.dart';
import 'package:doctor_consultation/ui/widgets/timeline/view_timeline.dart';
import 'package:doctor_consultation/ui/widgets/view_heading_appointment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateAppointmentBody extends StatelessWidget {
  final AppointmentDetailModel appointmentDetailModel;

  const TemplateAppointmentBody(
      {Key? key, required this.appointmentDetailModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          // margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: AppColors.greyLightest,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryLight,
                  blurRadius: 10.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointmentDetailModel.PatientName,
                        style: AppTextStyle.subtitle1(
                            txtColor: AppColors.greyDark),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        AppStrings.speciaList.toUpperCase(),
                        style: AppTextStyle.subtitle2(
                            txtColor: AppColors.greyBefore),
                      )
                    ],
                  ),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(AppImages.drPriyanka))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TemplateDateTime(
                    imgURL: AppImages.icSchedulePrimary,
                    imgSize: 18,
                    dtColor: AppColors.greyBefore,
                    title: appointmentDetailModel.getAppointmentDate(),
                  ),
                  TemplateDateTime(
                    imgURL: AppImages.icTimingPrimary,
                    imgSize: 18,
                    dtColor: AppColors.greyBefore,
                    title: appointmentDetailModel.getTiming(),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TemplateICText(
                txtTitle: "Location",
                txtSubTitle:
                    appointmentDetailModel.UserAddress!.getPreparedAddress(),
                txtCaption: appointmentDetailModel.UserAddress!.getCityPin(),
                txtTColor: AppColors.greyBefore,
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.imgMap),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.primaryLight,
                          blurRadius: 5.0,
                        ),
                      ]),
                ),
              ),
              Divider(
                color: AppColors.grey,
                thickness: 1.5,
                height: 20,
              ),
              Divider(
                thickness: 1.5,
                color: AppColors.grey,
              ),
              BlocProvider(
                create: (context) => PatientCaseHistoryCubit(),
                child: PatientCaseHistory(),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: BtnOutline(
                  title: "Cancel Appoinment",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
