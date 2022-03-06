import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';

class TemplateFactSlider extends StatefulWidget {
  final int index;
  const TemplateFactSlider({Key? key, this.index = 0}) : super(key: key);

  @override
  _TemplateFactSliderState createState() => _TemplateFactSliderState();
}

class _TemplateFactSliderState extends State<TemplateFactSlider> {
  final List<String> factList = [
    AppStrings.fact1,
    AppStrings.fact2,
    AppStrings.fact3,
    AppStrings.fact4,
    AppStrings.fact5,
  ];

  final List<String> mythList = [
    AppStrings.myth1,
    AppStrings.myth2,
    AppStrings.myth3,
    AppStrings.myth4,
    AppStrings.myth5,
  ];

  late List<Widget> factSliders;

  @override
  void initState() {
    super.initState();
    factSliders = factList
        .map((item) => Container(
              padding: const EdgeInsets.only(left: 10, top: 5),
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Myth: ", style: AppTextStyle.captionRF2()),
                      TextSpan(
                          text: mythList[widget.index],
                          style: AppTextStyle.captionRF1()),
                    ]),
                  ),
                  // Row(
                  //   children: [
                  //     Text("Fact: ", style: AppTextStyle.captionRF2()),
                  //     ExpandableText(
                  //       factList[widget.index],
                  //       style: AppTextStyle.body1(),
                  //       expandText: 'Read more',
                  //       collapseText: 'Read less',
                  //       maxLines: 3,
                  //       linkColor: AppColors.primary,
                  //     ),
                  //   ],
                  // ),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Fact: ", style: AppTextStyle.captionRF2()),
                      TextSpan(
                          text: factList[widget.index],
                          style: AppTextStyle.captionRF1()),
                      TextSpan(
                          text: " Read more", style: AppTextStyle.captionRF3())
                    ]),
                  ),
                ],
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    /***   Sliders   ****/
    return CarouselSlider(
      options: CarouselOptions(
          pageSnapping: false,
          viewportFraction: 5,
          autoPlay: true,
          enableInfiniteScroll: false,
          aspectRatio: 3.3,
          onPageChanged: (index, reason) {}),
      items: factSliders,
    );
  }
}
