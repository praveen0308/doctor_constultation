
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/schedule/temp_date.dart';
import 'package:doctor_consultation/ui/widgets/template_ic_text1.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/material.dart';

class AppointmentHistoryItem extends StatelessWidget {
  final AppointmentDetailModel appointmentDetailModel;
  final Function(int appointmentId) onCancelClick;
  final Function(int appointmentId) onViewDetailsClick;

  const AppointmentHistoryItem(
      {Key? key,
        required this.appointmentDetailModel,
        required this.onCancelClick,
        required this.onViewDetailsClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onViewDetailsClick(appointmentDetailModel.AppointmentID);

      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        decoration: BoxDecoration(
            color: AppColors.greyLightest,
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 5.0,
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(appointmentDetailModel.PatientName,
                style: AppTextStyle.headline6()),
            const SizedBox(
              height: 5,
            ),
            Text(
              AppStrings.speciaList.toUpperCase(),
              style: AppTextStyle.body3(txtColor: AppColors.greyBefore),
            ),
            const SizedBox(
              height: 10,
            ),
            TemplateICText(
              imgURL: AppImages.icClinicPrimary,
              txtTitle: "Location",
              txtSubTitle: appointmentDetailModel.UserAddress!.AddressLine1,
              txtCaption: appointmentDetailModel.UserAddress!.City,
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              thickness: 1,
              color: AppColors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TemplateDateTime(
                    imgURL: AppImages.icSchedulePrimary,
                    imgSize: 18,
                    dtColor: AppColors.greyBefore,
                    title: "${appointmentDetailModel.getAppointmentDate()}".toUpperCase()),
                TemplateDateTime(
                    imgURL: AppImages.icTimingPrimary,
                    imgSize: 18,
                    dtColor: AppColors.greyBefore,
                    title: appointmentDetailModel.getTiming().toUpperCase()),
                /*TemplateStatus(
                  title: appointmentDetailModel
                      .getAppointmentStats()
                      .toString(),
                  sColor: AppColors.greyLightest,
                  sSize: 5,
                ),*/

                Text(
                  appointmentDetailModel.getAppointmentStatus(),
                  style: AppTextStyle.overlieRF1(),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (appointmentDetailModel.AppointmentStatusID ==
                      AppConstants.pending)
                  Expanded(
                      child: BtnOutline(
                        title: "Cancel",
                        onBtnPressed: () {
                          onCancelClick(appointmentDetailModel.AppointmentID);
                        },
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: BtnFilled(
                      title: "View Appointment",
                      onBtnPressed: () {
                        onViewDetailsClick(appointmentDetailModel.AppointmentID);
                      },
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
