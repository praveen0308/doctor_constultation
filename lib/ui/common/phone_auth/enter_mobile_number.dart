import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/country_picker_ddl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterMobileNumber extends StatefulWidget {
  const EnterMobileNumber({Key? key}) : super(key: key);

  @override
  _EnterMobileNumberState createState() => _EnterMobileNumberState();
}

class _EnterMobileNumberState extends State<EnterMobileNumber> {
  String selectedCountryCode = "+91";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(
            flex: 1,
          ),
          Image(
            image: const AssetImage(AppImages.drPriyanka),
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
                      txtColor: AppColors.greyBefore, wFont: FontWeight.w500),
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
            child: BtnFilled(
              title: "Continue",
              onBtnPressed: () {},
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    )));
  }
}
