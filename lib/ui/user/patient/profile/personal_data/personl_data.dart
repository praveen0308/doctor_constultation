import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline_tab.dart';
import 'package:doctor_consultation/ui/widgets/edit_user_image.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/view_custom_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const maxLines = 5;
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children: [
              const AppBackNavBar(
                imgUrl: AppImages.icBackArrow,
                txtTitle: "Personal Data",
                navColor: AppColors.primary,
                bgColor: AppColors.greyLightest,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: EditUserImage()),
                    Text("Full name",style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter full name',),
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Contact",style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: AppColors.greyLight,
                        hintText: 'Enter the contact',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Age",style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),),
                    const SizedBox(
                      height: 8,
                    ),
                    const ViewCustomDropDown(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Gender",
                      style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BtnOutlineTabView(
                      txtTab1: "Female",
                      txtTab2: "Male",
                      txtTab3: "Other",
                      onTabSelected: (int index) {},
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Text("Write your problem (Optional)",style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),),
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // SizedBox(
                    //   height: maxLines * 30.0,
                    //   child: TextFormField(
                    //     maxLines: maxLines,
                    //     decoration: const InputDecoration(
                    //       border: OutlineInputBorder(),
                    //       fillColor: AppColors.greyLight,
                    //       hintText: 'Please write here your problem',
                    //     ),
                    //     keyboardType: TextInputType.text,
                    //     maxLength: 100,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: const BtnOutline(title: "Cancel"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: BtnFilled(
                            title: "Save",
                            onBtnPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
