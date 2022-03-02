import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/add_new_appointment_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/available_slots/appointment_available_slots_cubit.dart';
import 'package:doctor_consultation/ui/widgets/custom_chip_group.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppointmentAvailableSlots extends StatefulWidget {
  const AppointmentAvailableSlots({Key? key}) : super(key: key);

  @override
  _AppointmentAvailableSlotsState createState() =>
      _AppointmentAvailableSlotsState();
}

class _AppointmentAvailableSlotsState extends State<AppointmentAvailableSlots> {
  late AppointmentAvailableSlotsCubit _cubit;
  late AddNewAppointmentCubit _addNewAppointmentCubit;

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AppointmentAvailableSlotsCubit>(context);
    _addNewAppointmentCubit = BlocProvider.of<AddNewAppointmentCubit>(context);
    _cubit.fetchSlotsByDate(DateFormat("yyyy-MM-dd").format(selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Available Slots",
          style: AppTextStyle.headline6(),
        ),
        const SizedBox(
          height: 16,
        ),
        DatePicker(
          DateTime.now(),
          height: 90,
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.primary,
          selectedTextColor: Colors.white,
          daysCount: 30,
          onDateChange: (date) {
            selectedDate = date;
            _cubit.fetchSlotsByDate(DateFormat("yyyy-MM-dd").format(date));
            setState(() {});
          },
        ),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<AppointmentAvailableSlotsCubit,
            AppointmentAvailableSlotsState>(
          builder: (context, state) {
            if (state is ReceivedAvailableSlots) {
              return CustomChipGroup(
                  data: state.availableSlots,
                  onItemSelected: (slot) {
                    _addNewAppointmentCubit.slot = slot;
                  },
                  onSubmitted: (slots) {});
            }
            if (state is Error) {
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: AppColors.errorLight,
                  border: Border.all(color: AppColors.errorDark),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  state.msg,
                  style: AppTextStyle.captionOF1(),
                ),
              );
            }
            return const LoadingView(isVisible: true);
          },
        ),
      ],
    );
  }
}
