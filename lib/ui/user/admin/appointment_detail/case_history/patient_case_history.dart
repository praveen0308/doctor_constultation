import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/case_history/patient_case_history_cubit.dart';
import 'package:doctor_consultation/ui/widgets/view_heading_appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientCaseHistory extends StatefulWidget {
  const PatientCaseHistory({Key? key}) : super(key: key);

  @override
  State<PatientCaseHistory> createState() => _PatientCaseHistoryState();
}

class _PatientCaseHistoryState extends State<PatientCaseHistory> {
  late PatientCaseHistoryCubit _cubit;

   @override
    void initState() {
      super.initState();
      _cubit = BlocProvider.of<PatientCaseHistoryCubit>(context);
    }






  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ViewHeadingAppointment(
          imgURL: AppImages.icPastAppointmentPrimary,
          txtTitle: "Case History",
          txtSubTitle: "hide history",
          sImg: 20,
          tColor: AppColors.greyBefore,
          sColor: AppColors.primary,
        ),
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<PatientCaseHistoryCubit, PatientCaseHistoryState>(
          builder: (context, state) {
            if(state is Error){}
            if(state is ReceivedCaseHistory){}
            return Container();
          },
        )
      ],
    );
  }
}
