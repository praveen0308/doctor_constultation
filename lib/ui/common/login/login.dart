import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/common/login/login_cubit.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_consultation/route/route.dart' as route;
import '../../../models/user_roles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginCubit _loginCubit;

  bool _securityText = true;

  String username = "";
  String password = "";

  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginCubit = BlocProvider.of<LoginCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is Error) {
            showToast(state.msg, ToastType.error);
            _loginCubit.emit(LoginInitial());
          }
          if (state is LoginSuccessful) {
            FirebaseMessaging.instance.getToken().then((value) {
              _loginCubit.updateFCMToken(value!, state.userModel);
            });
          }
          if (state is TokenUpdatedSuccessfully) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              if (state.userModel.UserRoleID == UserRoles.registeredPatient) {
                Navigator.pushNamedAndRemoveUntil(
                    context, route.dashboardPatient, (route) => false);
              } else if (state.userModel.UserRoleID == UserRoles.doctor) {
                // Navigator.pushReplacementNamed(context, route.dashboardDoctor);
                Navigator.pushNamedAndRemoveUntil(
                    context, route.dashboardDoctor, (route) => false);
              }
            });
          }
          if (state is IncorrectCredential) {
            showToast("Incorrect user id or password!!", ToastType.error);
          }
          return Scaffold(
            body: Form(
              key: _loginFormKey,
              child: Padding(
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
                        username = text;

                      },
                      onFieldSubmitted: (text) {
                        username = text;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter the mobile number',
                          labelText: 'Mobile Number',
                          counterText: ""),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      maxLength: 10,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 10) {
                          return 'Please enter valid mobile';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onChanged: (text) {
                        password = text;

                      },
                      onFieldSubmitted: (text) {
                        password = text;
                        if (_loginFormKey.currentState!.validate()) {
                          _loginCubit.checkLoginDetails(username, password);
                        }
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
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      obscureText: _securityText,
                      obscuringCharacter: "*",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter valid password';
                        }
                        return null;
                      },
                    ),
                    /*Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forget password?",
                        style:
                            AppTextStyle.captionRF1(txtColor: AppColors.primary),
                      ),
                    ),*/
                    const SizedBox(
                      height: 20,
                    ),
                    CustomBtn(
                      title: "Login",
                      onBtnPressed: () {
                        if (_loginFormKey.currentState!.validate()) {
                          _loginCubit.checkLoginDetails(username, password);
                        }
                      },
                      isLoading: state is Loading,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, route.register);
                        },
                        child: const Text("Register"))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
