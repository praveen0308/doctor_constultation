import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_consultation/models/day_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/add_schedule/create_new_schedule_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/view_timing.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CreateNewSchedule extends StatefulWidget {
  const CreateNewSchedule({Key? key}) : super(key: key);

  @override
  _CreateNewScheduleState createState() => _CreateNewScheduleState();
}

class _CreateNewScheduleState extends State<CreateNewSchedule> {
  late CreateNewScheduleCubit _createNewScheduleCubit;
  late List<DayModel> dayNList = DateTimeHelper.getWeekdays();

  @override
  void initState() {
    super.initState();
    _createNewScheduleCubit = BlocProvider.of<CreateNewScheduleCubit>(context);

    _createNewScheduleCubit
        .fetchSlotsByDayId(DateTimeHelper.getDayIdByName(DateTime.now()));
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
              _createNewScheduleCubit
                  .fetchSlotsByDayId(DateTimeHelper.getDayIdByName(date));
              setState(() {});
            },
          ),
          BlocBuilder<CreateNewScheduleCubit, CreateNewScheduleState>(
            builder: (context, state) {
              if (state is Error) {
                showToast(state.msg, ToastType.error);
                /*return Center(
                              child: Text("No slots for the day!!!"),
                            )*/
              }
              if (state is ReceivedSlots) {
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: state.batches.length,
                    itemBuilder: (BuildContext context, int i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(state.batches[i].name),
                          ),
                          if (state.batches[i].slots.isEmpty)
                            const SizedBox(
                              height: 150,
                              child: Center(
                                child: Text("No slots !!!!"),
                              ),
                            ),
                          if (state.batches[i].slots.isNotEmpty)
                            Wrap(
                              spacing: 20,
                              runSpacing: 5,
                              children: List.generate(
                                state.batches[i].slots.length,
                                (index) => ViewTiming(
                                  slotModel: state.batches[i].slots[index],
                                  onClick: () {},
                                ),
                              ),
                            ),
                        ],
                      );
                    });
              }

              return LoadingView(isVisible: true);
            },
          ),
        ],
      ),
    );
  }
}
