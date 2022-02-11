
import 'package:doctor_consultation/widgets/template_fact_myth.dart';
import 'package:doctor_consultation/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/app_colors.dart';
import '../res/style_text.dart';
import '../user/patient/dashboard/fact_myth/fact_myth_list.dart';

class LayoutHomeopathyFact extends StatefulWidget {
  const LayoutHomeopathyFact({Key? key}) : super(key: key);

  @override
  _LayoutHomeopathyFactState createState() => _LayoutHomeopathyFactState();
}

class _LayoutHomeopathyFactState extends State<LayoutHomeopathyFact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  <Widget>[
            ViewMyRichText(
              text1: "Facts & Myth",
              text2: "Homeopathy",
              txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
            ),
            GestureDetector(
              onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => FactMythList())),
              child: Text(
                "See more",
                style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          color: AppColors.primaryLight,
          child: TemplateFactSlider(),
        )
      ],
    );
  }
}
