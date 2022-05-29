import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/models/user_roles.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/home_page/home_page_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/home_page/video_carousel/video_carousel.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_circle.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/fact_myth.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/patient_review.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:doctor_consultation/util/util_methods.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:doctor_consultation/route/route.dart' as route;

import '../../../../../local/app_storage.dart';
import '../../../../widgets/btn/btn_filled.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomePageCubit _cubit;
  final _storage = SecureStorage();
  List<VideoModel> videos = [];
  int roleId = 0;
  @override
  void initState() {
    super.initState();
    _storage.getUserRoleId().then((value) {
      roleId = value;
      setState(() {});
    });
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
                height: 30,
              ),
              // LayoutPatientReview(),
              Visibility(
                visible: roleId == UserRoles.nonRegisteredPatient,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: BtnFilled(
                    title: "Book an Appointment",
                    onBtnPressed: () async {
                      var isLoggedIn = await _storage.getLoginStatus();
                      if (isLoggedIn) {
                        Navigator.pushNamed(context, route.newAppointment);
                      } else {
                        Navigator.pushNamed(context, route.login);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Visibility(
                visible: roleId == UserRoles.nonRegisteredPatient,
                child: CustomBtn(
                    title: "Login",
                    onBtnPressed: () {
                      Navigator.pushNamed(context, route.login);
                    },
                    isLoading: false),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          );
        },
      ),
    );
  }
}
