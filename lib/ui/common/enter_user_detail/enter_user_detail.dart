import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/ui/common/enter_user_detail/enter_user_detail_cubit.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../res/app_colors.dart';
import '../../../../res/image_path.dart';

import 'package:doctor_consultation/route/route.dart' as route;

class EnterUserDetail extends StatefulWidget {
  const EnterUserDetail({Key? key}) : super(key: key);

  @override
  _EnterUserDetailState createState() => _EnterUserDetailState();
}

class _EnterUserDetailState extends State<EnterUserDetail> {
  late EnterUserDetailCubit _enterUserDetailCubit;
  String email = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    _enterUserDetailCubit = BlocProvider.of<EnterUserDetailCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<EnterUserDetailCubit, EnterUserDetailState>(
          builder: (context, state) {
            if (state is Success) {
              if (state.roleId == UserRoles.doctor) {
                Navigator.pushReplacementNamed(context, route.dashboardDoctor);
              } else {
                Navigator.pushReplacementNamed(context, route.dashboardPatient);
              }
            }
            if (state is Failed) {
              showToast("Failed !!!", ToastType.error);
            }

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                  const AppBackNavBar(
                    imgUrl: AppImages.icBackArrow,
                    navColor: AppColors.primary,
                    bgColor: AppColors.greyLightest,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SvgPicture.asset(
                    AppImages.imgMaleLogin,
                    height: 300,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter username',
                        labelText: 'Username'),
                    onChanged: (text) {
                      name = text;
                    },
                    onFieldSubmitted: (text) {
                      name = text;
                    },
                    keyboardType: TextInputType.name,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter email',
                        labelText: 'Email'),
                    keyboardType: TextInputType.name,
                    onChanged: (text) {
                      email = text;
                    },
                    onFieldSubmitted: (text) {
                      email = text;
                    },
                  ),
                  const Spacer(),
                  CustomBtn(
                    title: "Submit",
                    onBtnPressed: () =>
                        {_enterUserDetailCubit.updateUserDetails(name, email)},
                    isLoading: state is Loading,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
