import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/profile/personal_data/personal_data_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/custom_dropdown.dart';
import 'package:doctor_consultation/ui/widgets/edit_user_image.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalData extends StatefulWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  late PersonalDataCubit _cubit;
  UserModel userModel = UserModel();
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<PersonalDataCubit>(context);
    _cubit.getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Personal Data"),
        ),
        body: BlocBuilder<PersonalDataCubit, PersonalDataState>(
          builder: (context, state) {
            if (state is Error) {
              showToast(state.msg, ToastType.error);
            }
            if (state is ReceivedUserDetails) {
              userModel = state.userModel;
            }

            if (state is Loading) {
              return const LoadingView(isVisible: true);
            }

            if (state is UpdatedSuccessfully) {
              showToast("Updated Successfully !!!", ToastType.success);
              WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                Navigator.pop(context);
              });
            }
            return ScrollConfiguration(
              behavior: NoGlowBehaviour(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(child: EditUserImage()),
                          Text(
                            "Full name",
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyBefore),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: TextEditingController()
                              ..text = userModel.UserName ?? "",
                            onChanged: (text) {
                              userModel.UserName = text;
                            },
                            onFieldSubmitted: (text) {
                              userModel.UserName = text;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter full name',
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Contact",
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyBefore),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: TextEditingController()
                              ..text = userModel.MobileNo ?? "",
                            onChanged: (text) {
                              userModel.MobileNo = text;
                            },
                            onFieldSubmitted: (text) {
                              userModel.MobileNo = text;
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: AppColors.greyLight,
                              hintText: 'Enter the contact',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Age",
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyBefore),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: TextEditingController()
                              ..text = userModel.Age == 0
                                  ? ""
                                  : userModel.Age.toString(),
                            onChanged: (text) {
                              userModel.Age = int.parse(text);
                            },
                            onFieldSubmitted: (text) {
                              userModel.Age = int.parse(text);
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: AppColors.greyLight,
                              hintText: 'Enter age',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Gender",
                            style: AppTextStyle.captionRF1(
                                txtColor: AppColors.greyBefore),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomDropDown(
                              isOutlined: true,
                              hint: "Gender",
                              itemList: ["Male", "Female", "Other"],
                              onItemSelected: (element) {},
                              selectedIndex: getGenderIndex(userModel.Gender)),
                          /*BtnOutlineTabView(
                        txtTab1: "Female",
                        txtTab2: "Male",
                        txtTab3: "Other",
                        onTabSelected: (int index) {},
                      ),*/
                          const SizedBox(
                            height: 15,
                          ),
                          // Text("Write your problem (Optional)",style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),),
                          // const SizedBox(
                          //   height: 8,
                          // ),
                          // SizedBox(
                          //   height: maxLines * 30.0,
                          //   child: TextFormField(
                          //     maxLines: maxLines,
                          //     decoration: const InputDecoration(
                          //       border: OutlineInputBorder(),
                          //       fillColor: AppColors.greyLight,
                          //       hintText: 'Please write here your problem',
                          //     ),
                          //     keyboardType: TextInputType.text,
                          //     maxLength: 100,
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 15,
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.42,
                                child: BtnOutline(
                                  title: "Cancel",
                                  onBtnPressed: () {
                                    WidgetsBinding.instance!
                                        .addPostFrameCallback((timeStamp) {
                                      Navigator.pop(context);
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.42,
                                child: CustomBtn(
                                  title: "Save",
                                  onBtnPressed: () {
                                    _cubit.updateUserDetails(userModel);
                                  },
                                  isLoading: state is Updating,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  int getGenderIndex(String gender) {
    switch (userModel.Gender) {
      case "Male":
        {
          return 0;
        }
      case "Female":
        {
          return 1;
        }
      case "Other":
        {
          return 1;
        }
      default:
        {
          return 0;
        }
    }
  }
}
