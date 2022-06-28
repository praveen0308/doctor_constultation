import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TemplateVideoSlider extends StatefulWidget {
  final List<VideoModel> videos;
  const TemplateVideoSlider({Key? key, required this.videos}) : super(key: key);

  @override
  _TemplateVideoSliderState createState() => _TemplateVideoSliderState();
}

class _TemplateVideoSliderState extends State<TemplateVideoSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/youtubePlayer",
                arguments: widget.videos[index].VideoUrl);
          },
          child: Container(
            margin: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(widget.videos[index].getThumbnailUrl()),
                fit: BoxFit.fill,
              ),
            ),
          ),
        );
      },
      itemCount: widget.videos.length,
    );
  }
}
