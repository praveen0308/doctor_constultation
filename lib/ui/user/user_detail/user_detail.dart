import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/user_detail/user_detail_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/patient/alpha_patient.dart';
import 'package:doctor_consultation/ui/widgets/template_achievement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailScreen extends StatefulWidget {
  final int userID;
  const UserDetailScreen({Key? key, required this.userID}) : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  late UserDetailCubit _cubit;
  UserModel _userModel = UserModel();

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<UserDetailCubit>(context);
    _cubit.getUserDetailByUserID(widget.userID);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<UserDetailCubit, UserDetailState>(
        builder: (context, state) {
          if (state is ReceivedUserDetails) {
            _userModel = state.userModel;
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                if (state is Loading) const LoadingView(isVisible: true),
                if (state is ReceivedUserDetails)
                  (() {
                    return Column(
                      children: [
                        //#region header
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(AppImages.imgAvatar),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Text(
                                  _userModel.UserName ?? "N.A.",
                                  style: AppTextStyle.subtitle1(
                                      txtColor: AppColors.primary),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  _userModel.MobileNo ?? "N.A.",
                                  style: AppTextStyle.captionRF1(
                                      txtColor: AppColors.greyBefore),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "${_userModel.Gender} - ${_userModel.Age} Year Old",
                                  style: AppTextStyle.captionRF1(
                                      txtColor: AppColors.greyBefore),
                                ),
                              ],
                            ))
                          ],
                        ),

                        //#endregion

                        //#region Stats

                        Row(
                          children: [
                            TemplateAchievement(
                              iconImage: AppImages.icUserProfile,
                              txtTitle: _userModel.NoOfPatients.toString(),
                              txtSubtitle: "Patients",
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            TemplateAchievement(
                              iconImage: AppImages.icUserProfile,
                              txtTitle: _userModel.NoOfAppointments.toString(),
                              txtSubtitle: "Appointments",
                            )
                          ],
                        ),

                        //#endregion
                      ],
                    );
                  }()),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Patients",
                  style: AppTextStyle.subtitle3(),
                ),
                const SizedBox(
                  height: 16,
                ),
                if (state is LoadingPatients)
                  const LoadingView(isVisible: true),
                if (state is ReceivedPatientRecords)
                  (() {
                    if (state.patients.isEmpty) {
                      return NoRecordsView(
                          title: "No patient records!!!", onBtnClick: () {});
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: state.patients.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (_, index) {
                            var user = state.patients[index];
                            return TemplateAlphaPatient(
                              name: user.FullName!,
                              age: "${user.Age} Years",
                              gender: user.GenderID.toString(),
                              subtitle: user.MobileNo ?? "N.A.",
                            );
                          });
                    }
                  }())
              ],
            ),
          );
        },
      ),
    ));
  }
}
