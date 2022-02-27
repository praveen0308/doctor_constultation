import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/view_schedule/view_schedule_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../util/date_time_helper.dart';
import '../../../../widgets/btn/view_timing.dart';

class ViewSchedule extends StatefulWidget {
  const ViewSchedule({Key? key}) : super(key: key);

  @override
  _ViewScheduleState createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
  late ViewScheduleCubit _viewScheduleCubit;
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    _viewScheduleCubit = BlocProvider.of<ViewScheduleCubit>(context);
    _viewScheduleCubit
        .fetchSlotsByDate(DateFormat("yyyy-MM-dd").format(selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add schedule"),
      ),
      body: Column(
        children: [
          DatePicker(
            DateTime.now(),
            height: 90,
            initialSelectedDate: DateTime.now(),
            selectionColor: AppColors.primary,
            selectedTextColor: Colors.white,
            daysCount: 30,
            onDateChange: (date) {
              selectedDate = date;
              _viewScheduleCubit
                  .fetchSlotsByDate(DateFormat("yyyy-MM-dd").format(date));
              setState(() {});
            },
          ),
          Expanded(
            child: BlocBuilder<ViewScheduleCubit, ViewScheduleState>(
              builder: (context, state) {
                if (state is Error) {
                  showToast(state.msg, ToastType.error);
                  /*return Center(
                                child: Text("No slots for the day!!!"),
                              )*/
                }
                if (state is ReceivedAvailableSlots) {
                  if (state.slots.isNotEmpty) {
                    return Wrap(
                      spacing: 20,
                      runSpacing: 5,
                      children: List.generate(
                        state.slots.length,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          margin: const EdgeInsets.all(8),
                          child: Text(
                              "${state.slots[index].StartTime}-${state.slots[index].StartTime}"),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Not schedule yet !!!"),
                          CustomBtn(
                              title: "Add Schedule",
                              onBtnPressed: () {
                                Navigator.pushNamed(
                                    context, "/createNewSchedule",
                                    arguments: DateFormat("yyyy-MM-dd")
                                        .format(selectedDate));
                              },
                              isLoading: false)
                        ],
                      ),
                    );
                  }
                }

                return const LoadingView(isVisible: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
