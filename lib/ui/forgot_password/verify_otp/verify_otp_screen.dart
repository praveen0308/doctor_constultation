import 'dart:async';

import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/ui/forgot_password/verify_otp/verify_otp_cubit.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../widgets/btn/custom_btn.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  TextEditingController otpTxtController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  late CountdownTimerController _countdownTimerController;

  int waitingTime = DateTime.now().millisecondsSinceEpoch + 1000 * 10;  // 2 Minutes
  // int waitingTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60 * 2; // 2 Minutes

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    _countdownTimerController = CountdownTimerController(endTime: waitingTime, onEnd: () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter received OTP",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text("We have sent One Time Password to your Email ID"),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: const TextStyle(
                    color: AppColors.primaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: true,
                  obscuringCharacter: '*',
                  obscuringWidget: const Icon(
                    Icons.circle,
                    size: 16,
                  ),
                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "Enter valid OTP !!!";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: AppColors.primaryLightest,
                      borderWidth: 1),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: otpTxtController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                )),
            Center(
              child: CountdownTimer(
                controller: _countdownTimerController,
                onEnd: () {},
                endTime: waitingTime,
                endWidget:
                    TextButton(onPressed: () {
                      BlocProvider.of<VerifyOtpCubit>(context).resendOtp(widget.email);
                      _countdownTimerController.start();
                    }, child: const Text("Resend")),
              ),
            ),
            Row(
              children: [],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
                listener: (context, state) {
                  if(state is OtpVerificationSuccessful){
                    showToast("OTP verified successfully!!!", ToastType.success);
                    Navigator.pushNamed(context, "/updatePassword",arguments: widget.email);
                  }
                  if(state is OtpResendSuccessful){
                    showToast("OTP resent successfully !!!", ToastType.success);
                    otpTxtController.clear();
                  }
                  if(state is OtpResendFailed){
                    showToast("Unable to resend OTP !!!", ToastType.error);
                    otpTxtController.clear();
                  }
                  if(state is OtpVerificationFailed){
                    showToast("Invalid OTP !!!", ToastType.error);
                    otpTxtController.clear();
                  }
                  if(state is Error){
                    showToast(state.msg, ToastType.error);
                  }
                },
                builder: (context, state) {
                  return CustomBtn(
                      title: "Verify", onBtnPressed: () {
                        if(otpTxtController.text.length<6){
                          showToast("Enter complete 6-digit OTP !!!", ToastType.error);
                        }else{
                          BlocProvider.of<VerifyOtpCubit>(context).verifyOtp(widget.email,otpTxtController.text);
                        }

                  }, isLoading: state is Loading);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
