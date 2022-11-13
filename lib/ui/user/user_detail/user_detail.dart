import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/models/statistics_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/user_detail/user_detail_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:doctor_consultation/ui/widgets/patient/alpha_patient.dart';
import 'package:doctor_consultation/ui/widgets/statistics_view.dart';
import 'package:doctor_consultation/ui/widgets/template_achievement.dart';
import 'package:doctor_consultation/util/util_methods.dart';
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
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      body: BlocBuilder<UserDetailCubit, UserDetailState>(
        builder: (context, state) {
          if (state is ReceivedUserDetails) {
            _userModel = state.userModel;
          }
          if (state is Loading) return const LoadingView(isVisible: true);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ScrollConfiguration(
              behavior: NoGlowBehaviour(),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            //#region header
                            _userModel.getProfileUrl().isEmpty
                                ? const CircleAvatar(
                                    radius: 80,
                                    backgroundImage:
                                        AssetImage(AppImages.imgAvatar),
                                  )
                                : CircleAvatar(
                                    radius: 80,
                                    backgroundImage: NetworkImage(
                                        _userModel.getProfileUrl()),
                                  ),

                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              _userModel.UserName ?? "N.A.",
                              style: AppTextStyle.headline5(
                                  txtColor: AppColors.primary),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              _userModel.MobileNo ?? "N.A.",
                              style: AppTextStyle.subtitle1(
                                  txtColor: AppColors.greyBefore),
                            ),
                            /*const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${_userModel.Gender} - ${_userModel.Age} Year Old",
                              style: AppTextStyle.captionRF1(
                                  txtColor: AppColors.greyBefore),
                            ),
*/

                            //#endregion

                            //#region Stats

                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 100,
                                      child: StatisticsView(
                                        statisticsModel: StatisticsModel(
                                            title: "Patients",
                                            stat: _userModel.PatientCount),
                                        onItemClick: (action) {},
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 100,
                                      child: StatisticsView(
                                        statisticsModel: StatisticsModel(
                                            title: "Appointments",
                                            stat: _userModel.AppointmentCount),
                                        onItemClick: (action) {
                                          Navigator.pushNamed(
                                              context, "/userAppointments",
                                              arguments: widget.userID);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //#endregion
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Patients",
                        style: AppTextStyle.subtitle1(),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      if (state is LoadingPatients)
                        const LoadingView(isVisible: true),
                      if (state is ReceivedPatientRecords)
                        (() {
                          if (state.patients.isEmpty) {
                            return SizedBox(
                              height: 150,
                              child: Center(
                                child: Text(
                                  "No patient records !!!",
                                  style: AppTextStyle.captionOF1(),
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount: state.patients.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (_, index) {
                                  var user = state.patients[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, "/patientDetails",
                                          arguments: state.patients[index].ID);
                                    },
                                    child: TemplateAlphaPatient(
                                      name: user.FullName!,
                                      age: "${user.Age} Years",
                                      gender: user.getGender(),
                                      subtitle: user.MobileNo ?? "N.A.",
                                      picUrl: user.getProfileUrl(),
                                    ),
                                  );
                                });
                          }
                        }())
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
