import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/common/register/register_cubit.dart';

import 'package:doctor_consultation/ui/user/patient/dashboard/dashboard.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterCubit _registerCubit;
  bool _securityText = true;
  final UserModel _userModel = UserModel();

  @override
  void initState() {
    super.initState();
    _registerCubit = BlocProvider.of<RegisterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RegisterCubit, RegisterState>(
          builder: (context, state) {
            if (state is RegistrationSuccessful) {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pushReplacementNamed(context, route.login);
              });
            }
            if (state is UserAlreadyExist) {
              showToast("User already exists!!!", ToastType.error);
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
                    onChanged: (text) {
                      _userModel.UserName = text;
                    },
                    onFieldSubmitted: (text) {
                      _userModel.UserName = text;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter the fullname',
                        labelText: 'Full Name'),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      _userModel.EmailID = text;
                    },
                    onFieldSubmitted: (text) {
                      _userModel.EmailID = text;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        labelText: 'Email'),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      _userModel.MobileNo = text;
                    },
                    onFieldSubmitted: (text) {
                      _userModel.MobileNo = text;
                    },
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Mobile Number',
                        labelText: 'Mobile Number'),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      _userModel.Password = text;
                    },
                    onFieldSubmitted: (text) {
                      _userModel.Password = text;
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter the password',
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(_securityText
                              ? Icons.remove_red_eye
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _securityText = !_securityText;
                            });
                          },
                        )),
                    keyboardType: TextInputType.name,
                    obscureText: _securityText,
                    obscuringCharacter: "*",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomBtn(
                    title: "Register",
                    onBtnPressed: () {
                      _userModel.ID = 0;
                      _userModel.RegisteredOn = DateTime.now().toString();
                      _userModel.LangCulture = "";
                      _userModel.IsActive = true;
                      _userModel.UserRoleID = UserRoles.registeredPatient;

                      _registerCubit.checkLoginDetails(_userModel);
                    },
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
