import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/info_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SingingCharacter { upi, gPay, paytm, phonePe, ruPay }

class TemplatePaymentBody extends StatefulWidget {
  const TemplatePaymentBody({Key? key}) : super(key: key);

  @override
  State<TemplatePaymentBody> createState() => _TemplatePaymentBodyState();
}

class _TemplatePaymentBodyState extends State<TemplatePaymentBody> {
  SingingCharacter? _character = SingingCharacter.gPay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Account",
                  style:
                      AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹0.00",
                      style: AppTextStyle.subtitle1(
                          txtColor: AppColors.greyDarkest),
                    ),
                    ViewInfoChip(
                      title: "Deposite",
                      bgColor: AppColors.primary,
                      txtColor: AppColors.greyLightest,
                      onClick: () {},
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: AppColors.primaryLightest)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 250,
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.greyLightest, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.greyLightest, width: 0.0),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.greyLightest)),
                            hintText: 'Enter your amount',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: ViewInfoChip(
                          title: "+500",
                          bgColor: AppColors.greyLightest,
                          txtColor: AppColors.primary,
                          onClick: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ViewInfoChip(
                  title: "Amount",
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Pay with",
            style: AppTextStyle.body1(
                txtColor: AppColors.greyDarkest, wFont: FontWeight.w500),
          ),
          Column(
            children: [
              RadioListTile<SingingCharacter>(
                activeColor: AppColors.primary,
                title: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Image.asset(
                    AppImages.imgUPI,
                    height: 20,
                  ),
                ),
                value: SingingCharacter.upi,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                activeColor: AppColors.primary,
                title: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Image.asset(
                    AppImages.imgGPay,
                    height: 20,
                  ),
                ),
                value: SingingCharacter.gPay,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                activeColor: AppColors.primary,
                title: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Image.asset(
                    AppImages.imgPaytm,
                    height: 20,
                  ),
                ),
                value: SingingCharacter.paytm,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                activeColor: AppColors.primary,
                title: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Image.asset(
                    AppImages.imgPhonePe,
                    height: 20,
                  ),
                ),
                value: SingingCharacter.phonePe,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(

                activeColor: AppColors.primary,
                title: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: SvgPicture.asset(
                    AppImages.imgRuPay,
                    height: 35,
                  ),
                ),
                value: SingingCharacter.ruPay,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: BtnFilled(
              title: "Add now",
            ),
          )
        ],
      ),
    );
  }
}
