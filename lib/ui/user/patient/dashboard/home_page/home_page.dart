import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/home_page/home_page_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/home_page/video_carousel/video_carousel.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/fact_myth.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/patient_review.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:doctor_consultation/util/util_methods.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageCubit _cubit;
  List<VideoModel> videos = [];
  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<HomePageCubit>(context);
    _cubit.getAllVideos();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehaviour(),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          if (state is Error) {
            showToast(state.msg, ToastType.error);
          }

          if (state is ReceivedVideos) {
            videos.clear();
            videos.addAll(state.videos);
          }
          return ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: <Widget>[
              const AppNavBar(
                txtAddress: "",
              ),
              Text(DateTimeHelper.getCurrentDate().toUpperCase(),
                  style: (AppTextStyle.button1(txtColor: AppColors.primary))),
              const SizedBox(
                height: 5,
              ),
              Text(
                DateTimeHelper.getGreeting(),
                style: (AppTextStyle.headline6()),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: SvgPicture.asset(AppImages.imgOnBoarding1),
                height: 306,
                width: 306,
              ),
              const SizedBox(
                height: 10,
              ),
              if (state is LoadingVideos) const LoadingView(isVisible: true),
              if (videos.isNotEmpty) VideoCarousel(videos: videos),
              const SizedBox(
                height: 10,
              ),
              LayoutHomeopathyFact(),
              const SizedBox(
                height: 10,
              ),
              LayoutPatientReview(),
              const SizedBox(
                height: 10,
              ),
            ],
          );
        },
      ),
    );
  }
}
