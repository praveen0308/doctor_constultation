import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/add_new_appointment_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/patients_address/addresses_of_user_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip_with_icon.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressesOfUser extends StatefulWidget {
  const AddressesOfUser({Key? key}) : super(key: key);

  @override
  _AddressesOfUserState createState() => _AddressesOfUserState();
}

class _AddressesOfUserState extends State<AddressesOfUser> {
  late AddressesOfUserCubit _cubit;
  late AddNewAppointmentCubit _addNewAppointmentCubit;
  final List<AddressModel> _addresses = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<AddressesOfUserCubit>(context);
    _addNewAppointmentCubit = BlocProvider.of<AddNewAppointmentCubit>(context);
    _cubit.fetchAddressList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Appointment Locations",
              style: AppTextStyle.headline6(),
            ),
            ViewInfoChipWithIcon(
              imgUrl: AppImages.icPlus,
              title: "Add",
              txtColor: AppColors.primary,
              bgColor: AppColors.primaryLight,
              onMyTab: () {
                Navigator.pushNamed(context, "/addUpdateAddress");
              },
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        BlocBuilder<AddressesOfUserCubit, AddressesOfUserState>(
          builder: (context, state) {
            if (state is Error) {
              showToast(state.msg, ToastType.error);
              return Center(
                child: Text(state.msg),
              );
            }

            if (state is ReceivedAddressList) {
              _addresses.clear();
              _addresses.addAll(state.addresses);
              if (_addresses.isNotEmpty) {
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            _addNewAppointmentCubit.selectedLocationId =
                                state.addresses[selectedIndex].ID;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: index == selectedIndex
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  width: 1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                            color: AppColors.primary,
                                            width: 2)),
                                    child: Visibility(
                                        visible: index == selectedIndex,
                                        child: const Icon(
                                          Icons.circle,
                                          color: AppColors.primary,
                                          size: 18,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      Text(
                                        _addresses[index].LocationName,
                                        style: AppTextStyle.headline5(),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(_addresses[index].AddressLine1),
                                    ],
                                  ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return const SizedBox(
                        height: 8,
                      );
                    },
                    itemCount: _addresses.length);
              } else {
                return Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Text("No address records found !!"));
              }
            }
            return const LoadingView(isVisible: true);
          },
        ),
      ],
    );
  }
}
