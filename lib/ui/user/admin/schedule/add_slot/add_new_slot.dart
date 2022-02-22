import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/models/batch_model.dart';
import 'package:doctor_consultation/models/day_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/add_slot/add_slot_cubit.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/custom_dropdown.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_sheet/widget/sheet.dart';
import 'package:time_picker_sheet/widget/time_picker.dart';

class AddNewSlot extends StatefulWidget {
  final int index;

  const AddNewSlot({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  State<AddNewSlot> createState() => _AddNewSlotState();
}

class _AddNewSlotState extends State<AddNewSlot> {
  late AddSlotCubit _addSlotCubit;

  @override
  void initState() {
    populateDay();
    populateBatch();
    super.initState();
    _addSlotCubit = BlocProvider.of<AddSlotCubit>(context);
  }

  // TimeOfDay startTime = TimeOfDay.now();

  String startTime = "00:00:00";
  String endTime = "00:00:00";
  TimeOfDay fStartTime = TimeOfDay.now();
  TimeOfDay fEndTime = TimeOfDay.now();

  List<DayModel> days = [];
  List<BatchModel> batches = [];

  void populateDay() {
    days.add(DayModel(1, "Monday"));
    days.add(DayModel(2, "Tuesday"));
    days.add(DayModel(3, "Wednesday"));
    days.add(DayModel(4, "Thursday"));
    days.add(DayModel(5, "Friday"));
    days.add(DayModel(6, "Saturday"));
    days.add(DayModel(7, "Sunday"));
    setState(() {});
  }

  void populateBatch() {
    batches.add(BatchModel(1, "Morning"));
    batches.add(BatchModel(2, "Afternoon"));
    batches.add(BatchModel(3, "Evening"));
  }

  int selectedDayID = 0;
  int selectedBatchID = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddSlotCubit, AddSlotState>(
      builder: (context, state) {
        if (state is Error) {
          showToast(state.msg, ToastType.error);
        }
        if (state is Success) {
          showToast("Added successfully!!!", ToastType.success);
        }
        return ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: SafeArea(
            child: Scaffold(
              body: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const AppBackNavBar(
                    imgUrl: AppImages.icCross,
                    txtTitle: "Add Slot",
                    navColor: AppColors.primary,
                    bgColor: AppColors.greyLightest,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Day",
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyBefore),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomDropDown(
                              hint: "Select the day",
                              itemList: days,
                              onItemSelected: (item) {
                                selectedDayID = (item as DayModel).id;
                              }),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Batch",
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyBefore),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomDropDown(
                              hint: "Select the batch",
                              itemList: batches,
                              onItemSelected: (item) {
                                selectedBatchID = (item as BatchModel).id;
                              }),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Start Time",
                                    style: AppTextStyle.captionRF1(
                                        txtColor: AppColors.greyBefore),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _selectTime(context, 1);
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: AppColors.primary,
                                              width: 2)),
                                      child: Center(
                                        child: Text(
                                          formatTimeOfDay(fStartTime,"hh:mm a"),
                                          style: AppTextStyle.subtitle1(
                                              txtColor: AppColors.greyBefore),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "End Time",
                                    style: AppTextStyle.captionRF1(
                                        txtColor: AppColors.greyBefore),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _selectTime(context, 2);
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: AppColors.primary,
                                              width: 2)),
                                      child: Center(
                                        child: Text(
                                          formatTimeOfDay(fEndTime,"hh:mm a"),
                                          style: AppTextStyle.subtitle1(
                                              txtColor: AppColors.greyBefore),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: CustomBtn(
                              title: "Add",
                              onBtnPressed: () {
                                SlotModel slotModel = SlotModel();
                                slotModel.DayID = selectedDayID;
                                slotModel.BatchID = selectedBatchID;
                                slotModel.StartTime = formatTimeOfDay(fStartTime, "HH:mm");
                                slotModel.EndTime = formatTimeOfDay(fEndTime, "HH:mm");
                                slotModel.IsAvailable = true;

                                _addSlotCubit.createSlot(slotModel);
                              },
                              isLoading: state is Loading,
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _selectTime(BuildContext context, int x) async {
    final TimeOfDay? tod = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (tod != null ) {

      setState(() {
        if (x == 1) {
          fStartTime = tod;
        } else {
          fEndTime = tod;
        }
      });
    }
  }

  String formatTimeOfDay(TimeOfDay tod,String oFormat) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat(oFormat);  //"6:00 AM"
    return format.format(dt);
  }
}
