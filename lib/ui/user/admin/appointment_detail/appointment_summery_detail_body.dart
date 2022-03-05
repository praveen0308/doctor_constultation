import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/appointment_detail_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:doctor_consultation/ui/widgets/schedule/temp_date.dart';
import 'package:doctor_consultation/ui/widgets/template_ic_text1.dart';
import 'package:doctor_consultation/ui/widgets/timeline/view_timeline.dart';
import 'package:doctor_consultation/ui/widgets/view_heading_appointment.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplateAppointmentBody extends StatefulWidget {

  final AppointmentDetailModel appointmentDetailModel;

  const TemplateAppointmentBody(
      {Key? key, required this.appointmentDetailModel})
      : super(key: key);

  @override
  State<TemplateAppointmentBody> createState() => _TemplateAppointmentBodyState();
}

class _TemplateAppointmentBodyState extends State<TemplateAppointmentBody> {
  late AppointmentDetailCubit _cubit;

   @override
    void initState() {
      super.initState();
      _cubit = BlocProvider.of<AppointmentDetailCubit>(context);
    }

  @override
  Widget build(BuildContext context) {
    return Container(
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

        ],
      ),
    );
  }
}
