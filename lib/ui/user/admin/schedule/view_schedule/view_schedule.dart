import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/view_schedule/view_schedule_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/slot_view.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ViewSchedule extends StatefulWidget {
  const ViewSchedule({Key? key}) : super(key: key);

  @override
  _ViewScheduleState createState() => _ViewScheduleState();
}

class _ViewScheduleState extends State<ViewSchedule> {
  late ViewScheduleCubit _viewScheduleCubit;
  DateTime selectedDate = DateTime.now();
  int noOfSlots = 0;

  @override
  void initState() {
    super.initState();
    _viewScheduleCubit = BlocProvider.of<ViewScheduleCubit>(context);
    _viewScheduleCubit
        .fetchSlotsByDate(DateFormat("yyyy-MM-dd").format(selectedDate));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _viewScheduleCubit
          .fetchSlotsByDate(DateFormat("yyyy-MM-dd").format(selectedDate));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View schedule"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DatePicker(
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
          ),
          Expanded(
            child: BlocBuilder<ViewScheduleCubit, ViewScheduleState>(
              builder: (context, state) {
                if (state is Error) {
                  showToast(state.msg, ToastType.error);
                  return NoRecordsView(
                    title: state.msg,
                    onBtnClick: () {},
                  );
                  /*return Center(
                                child: Text("No slots for the day!!!"),
                              )*/
                }
                if (state is ReceivedAvailableSlots) {
                  noOfSlots = state.slots.length;

                  if (state.slots.isNotEmpty) {
                    return GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      itemCount: state.slots.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              crossAxisCount: 3,
                              childAspectRatio: 1.05),
                      itemBuilder: (_, index) {
                        var slot = state.slots[index];
                        return SlotView1(
                          startTime: slot.getFStartTime(),
                          isBooked: slot.IsBooked,
                          endTime: slot.getFEndTime(),
                        );
                        /*return SlotView(
                            onClick: (id) {},
                            id: slot.ScheduleID!,
                            title: slot.getTiming(),
                            isBooked: slot.IsBooked,
                            isAvailable: slot.IsAvailable,
                            isSelected: false);*/
                      },
                    );
                  } else {
                    return NoRecordsView(
                      title: "Not schedule yet !!!",
                      onBtnClick: () {
                        Navigator.pushNamed(context, "/createNewSchedule",
                            arguments:
                                DateFormat("yyyy-MM-dd").format(selectedDate));
                      },
                    );
                  }
                }

                return const LoadingView(isVisible: true);
              },
            ),
          ),

          /*Visibility(visible: noOfSlots!=0, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBtn(title: "Cancel Schedule", onBtnPressed: (){

            }, isLoading:false),
          ))*/
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(
              context, "/createNewSchedule",
              arguments: DateFormat("yyyy-MM-dd").format(selectedDate));

          if (result == true) {
            _viewScheduleCubit.fetchSlotsByDate(
                DateFormat("yyyy-MM-dd").format(selectedDate));
          }
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}

class SlotView1 extends StatelessWidget {
  final String startTime;
  final String endTime;
  final bool isBooked;

  const SlotView1(
      {Key? key,
      required this.startTime,
      required this.endTime,
      required this.isBooked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration:  BoxDecoration(
        color: Colors.white,borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary)
        ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            startTime,
            style: AppTextStyle.body1(),
          ),
          const Text(
            "to",
          ),
          Text(
            endTime,
            style: AppTextStyle.body1(),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(height: 8,thickness:1,color: AppColors.primary,),
          ),

          Text(
            isBooked ? "Booked" : "Available".toUpperCase(),
            style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
