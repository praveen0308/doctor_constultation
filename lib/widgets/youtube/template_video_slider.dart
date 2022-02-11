import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateVideoSlider extends StatefulWidget {
  const TemplateVideoSlider({Key? key}) : super(key: key);

  @override
  _TemplateVideoSliderState createState() => _TemplateVideoSliderState();
}

class _TemplateVideoSliderState extends State<TemplateVideoSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: AppColors.grey,
            //     blurRadius: 20.0,
            //   ),
            // ],
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage(AppImages.imgVideo1),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage(AppImages.imgVideo2),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: const DecorationImage(
              image: AssetImage(AppImages.imgVideo3),
              fit: BoxFit.fill,
            ),
          ),
          // child: Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: const <Widget>[
          //     Text(
          //       'Usable Flower for Health',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //         fontSize: 18.0,
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(15.0),
          //       child: Text(
          //         'Lorem Ipsum is simply dummy text use for printing and type script',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 15.0,
          //         ),
          //         textAlign: TextAlign.center,
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ],
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
    );
  }
}
