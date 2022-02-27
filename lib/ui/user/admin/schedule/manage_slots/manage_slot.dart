import 'package:doctor_consultation/models/batch_model.dart';
import 'package:doctor_consultation/models/day_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/manage_slots/manage_slot_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/manage_slots/manage_slot_cubit.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip_with_icon.dart';
import 'package:doctor_consultation/ui/widgets/btn/view_timing.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/day_chip1.dart';

import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:doctor_consultation/route/route.dart' as route;
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageSlot extends StatefulWidget {
  final int index;

  const ManageSlot({
    Key? key,
    this.index = 0,
  }) : super(key: key);

  @override
  State<ManageSlot> createState() => _ManageSlotState();
}

class _ManageSlotState extends State<ManageSlot> {
  late ManageSlotCubit _manageSlotCubit;
  late List<DayModel> dayNList = DateTimeHelper.getWeekdays();
  List<BatchModel> batches = DateTimeHelper.getBatches();

  @override
  void initState() {
    super.initState();
    _manageSlotCubit = BlocProvider.of<ManageSlotCubit>(context);
    _manageSlotCubit.fetchSlotsByDayId(dayNList[0].id);
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                const AppBackNavBar(
                  txtTitle: "Manage Slot",
                  navColor: AppColors.primary,
                  bgColor: AppColors.greyLightest,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //#region Day navigator
                      FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              dayNList.length,
                              (index) => DayChip1(
                                title: dayNList[index].name.substring(0, 3),
                                onClick: () {
                                  dayNList.forEach(
                                      (element) => element.isActive = false);
                                  dayNList[index].isActive = true;
                                  setState(() {});

                                  _manageSlotCubit
                                      .fetchSlotsByDayId(dayNList[index].id);
                                },
                                isSelected: dayNList[index].isActive,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //#endregion
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Set Slot".toUpperCase(),
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyDark),
                          ),
                          ViewInfoChipWithIcon(
                            imgUrl: AppImages.icPlus,
                            title: "Add",
                            txtColor: AppColors.primary,
                            bgColor: AppColors.primaryLight,
                            onMyTab: () =>
                                Navigator.pushNamed(context, route.addSlot),
                          ),
                        ],
                      ),
                      //#region Body
                      BlocBuilder<ManageSlotCubit, ManageSlotState>(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.batches[i].name),
                                      if (state.batches[i].slots.isEmpty)
                                        SizedBox(
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
                                              slotModel:
                                                  state.batches[i].slots[index],
                                              onClick: (slot) {},
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

                      //#endregion
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
