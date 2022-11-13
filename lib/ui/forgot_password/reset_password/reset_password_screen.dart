import 'package:doctor_consultation/ui/forgot_password/reset_password/reset_password_cubit.dart';
import 'package:doctor_consultation/ui/forgot_password/verify_otp/verify_otp_screen.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repository/account_repository.dart';
import '../../../util/util_methods.dart';


class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
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
              "Enter your registered Email ID",
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: _emailController,
              onChanged: (text) {},
              onFieldSubmitted: (text) {},
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'abc@example.com',
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty || !validateEmail(value)) {
                  return 'Please enter valid email id';
                }
                return null;
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(

                listener: (context,state){
                  if(state is ResetPasswordSuccessful){
                    showToast("OTP sent to email successfully!!!", ToastType.success);
                    Navigator.pushNamed(context, "/verifyOtpScreen",arguments: _emailController.text);
                  }
                  if(state is ResetPasswordFailed){
                    showToast("Invalid Email Id !!!", ToastType.error);
                  }
                  if(state is Error){
                    showToast(state.msg, ToastType.error);
                  }
                },
                builder: (context, state) {
                  return CustomBtn(
                      title: "Continue",
                      onBtnPressed: () {
                        BlocProvider.of<ResetPasswordCubit>(context).resetPassword(_emailController.text);
                      },
                      isLoading: state is Loading);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
