import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/btn/view_timing.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'create_new_schedule_cubit.dart';

class CreateNewScheduleArgs{
  final String scheduleDate;
  final List<ScheduleModel> schedules;

  CreateNewScheduleArgs(this.scheduleDate, this.schedules);
}
class CreateNewSchedule extends StatefulWidget {
  final CreateNewScheduleArgs args;

  const CreateNewSchedule({Key? key, required this.args})
      : super(key: key);

  @override
  _CreateNewScheduleState createState() => _CreateNewScheduleState();
}

class _CreateNewScheduleState extends State<CreateNewSchedule> {
  late CreateNewScheduleCubit _createNewScheduleCubit;
  final List<int> selectedSlots = [];

  @override
  void initState() {
    super.initState();
    _createNewScheduleCubit = BlocProvider.of<CreateNewScheduleCubit>(context);
    _createNewScheduleCubit.fetchSlotsByDayId(1,widget.args.schedules);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add schedule"),
      ),
      body: BlocBuilder<CreateNewScheduleCubit, CreateNewScheduleState>(
        builder: (context, state) {
          if (state is Error) {
            showToast(state.msg, ToastType.error);
          }
          if (state is SubmissionSuccess) {
            _createNewScheduleCubit.close();
            showToast("Schedule submitted successfully !!!", ToastType.success);
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pop(context,true);
            });
          }
          if (state is SubmissionFailure) {
            showToast("Schedule submitted failed !!!", ToastType.error);
          }

          if (state is ReceivedSlots) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select slots you want add",
                    style: AppTextStyle.captionOF1(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.builder(

                      itemCount: state.slots.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        crossAxisCount: 2,
                        childAspectRatio: 4
                      ),
                      itemBuilder: (_, index) {
                        return ViewTiming(
                          slotModel: state.slots[index],
                          onClick: (slot) {
                            if (slot.IsAvailable!) {
                              selectedSlots.add(slot.ID!);
                            } else {
                              selectedSlots.remove(slot.ID);
                            }

                          },

                        );
                      },
                    ),
                  ),
                  CustomBtn(
                      title: "Submit",
                      onBtnPressed: () {
                        _createNewScheduleCubit.submitSlots(
                            widget.args.scheduleDate, selectedSlots);
                      },
                      isLoading: state is SubmittingSlots)
                ],
              ),
            );
          }

          return const LoadingView(isVisible: true);
        },
      ),
    );
  }
}
