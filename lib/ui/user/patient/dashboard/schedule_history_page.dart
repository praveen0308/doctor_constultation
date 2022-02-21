import 'package:doctor_consultation/bloc/appointment/appointment_history_cubit.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_tab.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/template_schedule_detail.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScheduleHistoryPage extends StatefulWidget {
  const ScheduleHistoryPage({Key? key}) : super(key: key);

  @override
  _ScheduleHistoryPageState createState() => _ScheduleHistoryPageState();
}

class _ScheduleHistoryPageState extends State<ScheduleHistoryPage> {
  late AppointmentHistoryCubit _appointmentHistoryCubit;

  @override
  void initState() {
    super.initState();
    _appointmentHistoryCubit = BlocProvider.of<AppointmentHistoryCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentHistoryCubit, AppointmentHistoryState>(
  builder: (context, state) {
    if(state is Error){
      return Center(
        child: Text(state.msg),
      );
    }
    if(state is ReceivedAppointHistory){
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

              ListView.builder(
                itemCount: state.appointments.length,
                  itemBuilder: (BuildContext context,int index){
                return TemplateScheduleDetail(appointmentDetailModel: state.appointments[index]);
              })

            ],
          ),
        ),
      );
    }
    return Center(
      child: SpinKitCircle(),
    );

  },
);
  }
}
