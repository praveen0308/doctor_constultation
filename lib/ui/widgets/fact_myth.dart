import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_consultation/models/api/fact_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/fact_myth/fact_myth_list.dart';

import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../res/app_string.dart';

class LayoutHomeopathyFact extends StatefulWidget {
  const LayoutHomeopathyFact({Key? key}) : super(key: key);

  @override
  _LayoutHomeopathyFactState createState() => _LayoutHomeopathyFactState();
}

class _LayoutHomeopathyFactState extends State<LayoutHomeopathyFact> {
  final List<FactModel> facts = [];

  @override
  void initState() {
    facts.add(FactModel(
        FactID: 0, Title: AppStrings.myth1, Description: AppStrings.fact1));
    facts.add(FactModel(
        FactID: 1, Title: AppStrings.myth2, Description: AppStrings.fact2));
    facts.add(FactModel(
        FactID: 2, Title: AppStrings.myth3, Description: AppStrings.fact3));
    facts.add(FactModel(
        FactID: 3, Title: AppStrings.myth4, Description: AppStrings.fact4));
    facts.add(FactModel(
        FactID: 4, Title: AppStrings.myth5, Description: AppStrings.fact5));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ViewMyRichText(
              text1: "Facts & Myth",
              text2: " Homeopathy",
              txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
              txtStyle2: AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
            ),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FactMythList())),
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
        CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 3 / 1.5,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            viewportFraction: 0.9,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColors.primaryLight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Myth: ", style: AppTextStyle.captionRF2()),
                      TextSpan(
                          text: facts[index].Title,
                          style: AppTextStyle.captionRF1()),
                    ]),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Fact: ", style: AppTextStyle.captionRF2()),
                      TextSpan(
                        text:
                            facts[index].Description!.substring(0, 100) + "...",
                        style: AppTextStyle.captionRF1(),
                      ),
                      TextSpan(
                          text: " See More",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FactMythList())),
                          style: AppTextStyle.captionRF2(
                              txtColor: AppColors.primary)),
                    ]),
                  ),
                ],
              ),
            );
          },
          itemCount: facts.length,
        )
      ],
    );
  }
}
