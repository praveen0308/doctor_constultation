import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/dashboard.dart';
import 'package:doctor_consultation/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/widgets/btn/btn_filled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _securityText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                    hintText: 'Enter the username',
                    labelText: 'Username'),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget password?",
                  style: AppTextStyle.captionRF1(txtColor: AppColors.primary),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BtnFilled(
                  title: "Login",
                  onBtnPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardPatient())))
            ],
          ),
        ),
      ),
    );
  }
}
