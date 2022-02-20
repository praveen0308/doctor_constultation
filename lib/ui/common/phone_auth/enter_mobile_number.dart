import 'package:doctor_consultation/bloc/phone_auth/phone_auth_cubit.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/country_picker_ddl.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class EnterMobileNumber extends StatefulWidget {
  const EnterMobileNumber({Key? key}) : super(key: key);

  @override
  _EnterMobileNumberState createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  late PhoneAuthCubit _phoneAuthCubit;
  String selectedCountryCode = "+91";
  String mobileNumber = "";
  var isLoading = false;

  @override
  void initState() {
    _phoneAuthCubit = BlocProvider.of<PhoneAuthCubit>(context);

    super.initState();
  }

  @override
  void dispose() {
    _phoneAuthCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
        builder: (context, state) {
          if (state is Loading) {
            isLoading = true;
          }

          if (state is Error) {
            isLoading = false;
            showToast(state.msg, ToastType.error);
          }
          if (state is OnVerificationCompleted) {
            isLoading = false;
            showToast("Verification done!!!", ToastType.success);
          }
          if (state is LoginSuccessful) {
            isLoading = false;
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              if (state.roleId == UserRoles.registeredPatient) {
                Navigator.pushReplacementNamed(context, route.dashboardPatient);
              } else if (state.roleId == UserRoles.doctor) {
                Navigator.pushReplacementNamed(context, route.dashboardDoctor);
              }
            });
          }
          if (state is OtpSent) {
            isLoading = false;
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              Navigator.pushNamed(context, route.verifyOtp);
            });
          }
          if (state is InvalidPhoneNumber) {
            isLoading = false;
            showToast("Invalid phone number!!!", ToastType.error);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 1,
              ),
              const Image(
                image: AssetImage(AppImages.drPriyanka),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter your\nmobile number",
                      style: AppTextStyle.headline4(),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "We will send you confirmation code",
                      style: AppTextStyle.body3(
                          txtColor: AppColors.greyBefore,
                          wFont: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Container(
                width: double.infinity,
                height: 65,
                child: Card(
                  elevation: 5,
                  shadowColor: AppColors.primaryLightest,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        CountryPickerDdl(onCountrySelected: (country) {
                          setState(() {
                            selectedCountryCode = country.code;
                          });
                        }),
                        Container(
                          width: 1,
                          color: AppColors.grey,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        Text(
                          selectedCountryCode,
                          style: AppTextStyle.captionOF1(),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: TextField(
                          textAlignVertical: TextAlignVertical.top,
                          keyboardType: TextInputType.number,
                          style: AppTextStyle.captionOF1(),
                          maxLength: 10,
                          onChanged: (text) {
                            mobileNumber = text;
                          },
                          onSubmitted: (text) {
                            mobileNumber = text;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "0000000000",
                              counterText: "",
                              contentPadding: EdgeInsets.only(bottom: 5)),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomBtn(
                  title: "Continue",
                  onBtnPressed: () {
                    _phoneAuthCubit.verifyMobileNumber(mobileNumber);
                  },
                  isLoading: isLoading,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          );
        },
      ),
    )));
  }
}
