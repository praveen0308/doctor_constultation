import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/add_schedule/create_new_schedule_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/btn/view_timing.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewSchedule extends StatefulWidget {
  final String scheduleDate;

  const CreateNewSchedule({Key? key, required this.scheduleDate})
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
    _createNewScheduleCubit.fetchSlotsByDayId(1);
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
            showToast("Schedule submitted successfully !!!", ToastType.success);
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pop(context);
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
                            widget.scheduleDate, selectedSlots);
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
