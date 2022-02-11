import 'package:doctor_consultation/common/success_view.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/widgets/btn/btn_filled.dart';
import 'package:doctor_consultation/widgets/btn/btn_outline.dart';
import 'package:doctor_consultation/widgets/btn/btn_outline_tab.dart';
import 'package:doctor_consultation/widgets/view_custom_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class TemplateAppointmentView extends StatefulWidget {
  const TemplateAppointmentView({Key? key}) : super(key: key);

  @override
  State<TemplateAppointmentView> createState() =>
      _TemplateAppointmentViewState();
}

class _TemplateAppointmentViewState extends State<TemplateAppointmentView> {
  @override
  Widget build(BuildContext context) {
    const maxLines = 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Appointment For".toUpperCase(),
            style: AppTextStyle.captionRF1(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Full name",
            style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter full name',
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Contact",
            style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
          ),
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
          Text(
            "Age",
            style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
          ),
          const SizedBox(
            height: 8,
          ),
          ViewCustomDropDown(),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Gender",
            style: AppTextStyle.captionRF1(txtColor: AppColors.greyDark),
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
          Text(
            "Write your problem (Optional)",
            style: AppTextStyle.captionRF1(txtColor: AppColors.greyBefore),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: maxLines * 30.0,
            child: TextFormField(
              maxLines: maxLines,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                fillColor: AppColors.greyLight,
                hintText: 'Please write here your problem',
                hintStyle: TextStyle(color: AppColors.grey)
              ),
              keyboardType: TextInputType.multiline,
              maxLength: 100,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.42,
                child: BtnOutline(title: "Cancel"),
              ),
              SizedBox(
                child: BtnFilled(
                  title: "Set Appointment",
                  onBtnPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SuccessPage())),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
