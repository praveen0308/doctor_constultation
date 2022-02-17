import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplatePatientReview extends StatefulWidget {
  const TemplatePatientReview({Key? key}) : super(key: key);

  @override
  _TemplatePatientReviewState createState() => _TemplatePatientReviewState();
}

class _TemplatePatientReviewState extends State<TemplatePatientReview> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  late List<Widget> imageSliders;

  @override
  void initState() {
    super.initState();
    imageSliders = imgList
        .map(
          (item) => Container(
            padding: const EdgeInsets.all(8),
            color: AppColors.greyLightest,
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(AppImages.imgAvatar),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Mr. Sunil Yadav",
                                style: AppTextStyle.subtitle1(),

                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.primaryLight,
                                    borderRadius: BorderRadius.circular(12)),
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      child: SvgPicture.asset(
                                        AppImages.icStarFill,
                                        color: AppColors.primary,
                                      ),
                                      height: 15,
                                      width: 15,
                                    ),
                                    Text("4.7", style: AppTextStyle.captionRF2()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            child: Text(
                              "3 days ago",
                              style: AppTextStyle.captionRF2(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                    child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "))
              ],
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          pageSnapping: false,
          viewportFraction: 1,
          autoPlay: true,
          enableInfiniteScroll: false,
          aspectRatio: 3.3,
          onPageChanged: (index, reason) {}),
      items: imageSliders,
    );
  }
}
