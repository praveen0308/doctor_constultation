import 'package:doctor_consultation/ui/user/admin/home_page/current_day_appointment/current_day_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/admin_today_task.dart';
import '../../../../widgets/loading_view.dart';

class CurrentDayAppointment extends StatefulWidget {
  const CurrentDayAppointment({Key? key}) : super(key: key);

  @override
  State<CurrentDayAppointment> createState() => _CurrentDayAppointmentState();
}

class _CurrentDayAppointmentState extends State<CurrentDayAppointment> {
  late CurrentDayAppointmentCubit _cubit;


  @override
  void initState() {
    _cubit = BlocProvider.of<CurrentDayAppointmentCubit>(context);
    _cubit.getAppointmentsByDate();
  }

  var appointments = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentDayAppointmentCubit, CurrentDayAppointmentState>(
      builder: (context, state) {
        if(state is Error){
          return SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [const Icon(
                Icons.error
              ),const SizedBox(width: 16,),Text(state.msg)],
            ),
          );
        }


        if(state is ReceivedAppointments){

          return GestureDetector(
            onTap: () {},
            child: ViewTodayTask(
              totalAppointment: state.total,
              remainingAppointment: state.remaining,
              completedAppointment: state.completed,
            ),
          );
        }

        if(state is ReceivedCachedAppointments){

          return GestureDetector(
            onTap: () {},
            child: ViewTodayTask(
              totalAppointment: state.data[0],
              remainingAppointment: state.data[1],
              completedAppointment: state.data[2],
            ),
          );

        }
        return const SizedBox(
          height: 120,
          child: LoadingView(
            isVisible: true,
          ),
        );
      },
    );
  }
}
