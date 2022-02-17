import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/patient_review/patient_review_list.dart';
import 'package:doctor_consultation/ui/widgets/template_patient_review.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutPatientReview extends StatefulWidget {
  const LayoutPatientReview({Key? key}) : super(key: key);

  @override
  _LayoutPatientReviewState createState() => _LayoutPatientReviewState();
}

class _LayoutPatientReviewState extends State<LayoutPatientReview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  <Widget>[
            ViewMyRichText(
              text1: "Patient",
              text2: "Review's",
              txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
            ),
            GestureDetector(
              onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => PatientReviewList())),
              child: Text(
                "See more",
                style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
              ),
            ),
          ],
        ),
        Container(
          color: AppColors.grey,
          height: 110,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: TemplatePatientReview(),
        )
      ],
    );
  }
}


