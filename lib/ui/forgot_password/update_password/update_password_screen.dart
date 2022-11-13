import 'package:doctor_consultation/ui/forgot_password/update_password/update_password_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePasswordScreen extends StatefulWidget {
  final String email;

  const UpdatePasswordScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool _isNewPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set new password",
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 16,),
              const Spacer(flex: 1,),
              TextFormField(
                controller: _pass,
                onChanged: (text) {},
                onFieldSubmitted: (text) {},
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'New Password',
                    labelText: 'New Password',
                    counterText: "",
                    suffixIcon: IconButton(
                      icon: Icon(_isNewPasswordVisible
                          ? Icons.remove_red_eye
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isNewPasswordVisible = !_isNewPasswordVisible;
                        });
                      },
                    )),
                keyboardType: TextInputType.name,
                obscureText: _isNewPasswordVisible,
                obscuringCharacter: "*",
                textInputAction: TextInputAction.done,
                maxLength: 16,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return "Enter valid password !\nPassword length should be between 8 and 16.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16,),
              TextFormField(
                controller: _confirmPass,
                onChanged: (text) {},
                onFieldSubmitted: (text) {},
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Confirm Password',
                    labelText: 'Confirm Password',
                    counterText: "",
                    suffixIcon: IconButton(
                      icon: Icon(_isConfirmPasswordVisible
                          ? Icons.remove_red_eye
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                        });
                      },
                    )),
                keyboardType: TextInputType.name,
                obscureText: _isConfirmPasswordVisible,
                obscuringCharacter: "*",
                textInputAction: TextInputAction.done,
                maxLength: 16,
                  validator: (value){
                    if (value == null || value.isEmpty || value.length < 8) {
                      return "Enter valid password !\nPassword length should be between 8 and 16.";
                    }
                    if(value != _pass.text) {
                      return "Password doesn't match!!";
                    }
                    return null;
                  }
              ),
              const Spacer(flex: 9,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                  listener: (context, state) {
                    if(state is UpdatePasswordSuccessful){
                      showToast("Password updated successfully!!!", ToastType.success);
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                    }

                    if(state is UpdatePasswordFailed){
                      showToast("Unable to update password !!!", ToastType.error);

                    }
                    if(state is Error){
                      showToast(state.msg, ToastType.error);
                    }
                  },
                  builder: (context, state) {

                    return CustomBtn(
                        title: "Confirm", onBtnPressed: () {
                      if(_form.currentState!.validate()){
                        BlocProvider.of<UpdatePasswordCubit>(context).updatePassword(widget.email, _pass.text);
                      }

                    }, isLoading: state is Loading);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
