import 'package:doctor_consultation/models/action_model.dart';
import 'package:doctor_consultation/models/api/stat_model.dart';
import 'package:doctor_consultation/models/statistics_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/admin/home_page/home_page_cubit.dart';
import 'package:doctor_consultation/ui/widgets/admin_today_task.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_nav_bar.dart';
import 'package:doctor_consultation/ui/widgets/btn/search_patient_filter.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctor_consultation/route/route.dart' as route;
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/statistics_view.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({Key? key}) : super(key: key);

  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  final List<ActionModel> quickActions = AppConstants.getQuickActions();
  late HomePageCubit _cubit;


  var appointments = [];

  List<StatisticsModel> stats = [];


  @override
  void initState() {
    super.initState();

    _cubit = BlocProvider.of<HomePageCubit>(context);
    _cubit.getAppointmentsByDate();

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    const double itemHeight = 120;
    final double itemWidth = size.width / 2;

    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) {

        if(state is ReceivedAppointments){
          appointments.add(state.total);
          appointments.add(state.remaining);
          appointments.add(state.completed);

        }

        if(state is ReceivedStats){
          stats.clear();
          stats.addAll(state.stats);
        }

        return ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: <Widget>[
              const AppNavBar(),
              const SizedBox(height: 16,),
              Text(DateTimeHelper.getGreeting(),
                  style: (AppTextStyle.subtitle1(
                      txtColor: AppColors.primary, wFont: FontWeight.w500))),
              const SizedBox(
                height: 8,
              ),
              ViewMyRichText(
                text1: AppStrings.drFName,
                txtStyle1: AppTextStyle.headline5(txtColor: AppColors.greyDark),
                text2: AppStrings.drLName,
                txtStyle2:
                    AppTextStyle.headline5(txtColor: AppColors.greyBefore),
              ),
              const SizedBox(
                height: 24,
              ),
              ViewSearchPatientFilter(
                isDisabled: true,
                onClick: () => Navigator.pushNamed(context, route.searchPatients),
                onTextUpdated: (String text) {},
              ),
              const SizedBox(
                height: 5,
              ),
              if (state is LoadingTodayAppointments)
                const SizedBox(
                  height: 120,
                  child: LoadingView(
                    isVisible: true,
                  ),
                ),
              if (appointments.isNotEmpty)
                GestureDetector(
                  onTap: () {},
                  child: ViewTodayTask(
                    totalAppointment: appointments[0],
                    remainingAppointment: appointments[1],
                    completedAppointment: appointments[2],
                  ),
                ),
              const SizedBox(
                height: 12,
              ),
              ViewMyRichText(
                text1: "Stati",
                text2: "stics",
                txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                txtStyle2:
                AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
              ),
              const SizedBox(
                height: 10,
              ),
              if(state is LoadingStats) const LoadingView(isVisible: true),
              if(stats.isNotEmpty) GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: stats.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.75,
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4),
                  itemBuilder: (_, index) {
                    return StatisticsView(
                        statisticsModel: stats[index],
                        onItemClick: (action) {
                          // navigateQuickActions(action!);
                        });
                  }),
              const SizedBox(height: 16),

              ViewMyRichText(
                text1: "Quick",
                text2: " Action",
                txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                txtStyle2:
                    AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
              ),
              const SizedBox(
                height: 10,
              ),

              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: quickActions.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (itemWidth / itemHeight),
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,),
                  itemBuilder: (_, index) {
                    return DashboardItem(
                        actionModel: quickActions[index],
                        onItemClick: (action) {
                          navigateQuickActions(action);
                        });
                  })

              /*SizedBox(
                height: 120,
                child: ListView.builder(
                    shrinkWrap: true,
                    physhics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: quickActions.length,
                    itemBuilder: (_, index) {
                      return QuickActionItem(
                          actionModel: quickActions[index],
                          onClick: (action) {
                            navigateQuickActions(action);
                          });
                    }),
              ),
              */

              /* Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ViewMyRichText(
                text1: "Today’s",
                text2: " Patients",
                txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                txtStyle2:
                    AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
              ),
              GestureDetector(
                onTap: () {},
                //=>Navigator.push(context, MaterialPageRoute(builder: (context) => YouTubeList()))
                child: Text(
                  "View all",
                  style: AppTextStyle.subtitle2(txtColor: AppColors.primary),
                ),
              ),
            ],
          ),
          TemplateAlphaPatient(),*/
              /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ViewMyRichText(
                text1: "Next",
                text2: " Patient",
                txtStyle1: AppTextStyle.subtitle1(txtColor: AppColors.greyDark),
                txtStyle2:
                    AppTextStyle.subtitle1(txtColor: AppColors.greyBefore),
              ),

            ],
          ),
          TemplateNextPatient(),*/

              /* const SizedBox(
                height: 16,
              ),*/
              /*BtnFilled(
            title: "View Schedule",
            onBtnPressed: () {
              Navigator.pushNamed(context, "/viewSchedule");
            },
          ),*/
              ,
              const SizedBox(
                height: 100,
              )
            ],
          ),
        );
      },
    );
  }

  void navigateQuickActions(AppNavActions action) {
    switch(action){
      case AppNavActions.viewSchedule:
        Navigator.pushNamed(context, "/${action.name}");
        break;
      case AppNavActions.uploadVideo:
        // TODO: Handle this case.
        break;
      case AppNavActions.manageVideos:
        Navigator.pushNamed(context, "/${action.name}");
        break;
      case AppNavActions.manageUsers:
        Navigator.pushNamed(context, route.searchUser);
        break;
      case AppNavActions.managePatients:
        Navigator.pushNamed(context, route.searchPatients);
        break;
      case AppNavActions.transactions:
        Navigator.pushNamed(context, route.transactions);
        break;
    }

  }
}


class DashboardItem extends StatelessWidget {
  final ActionModel actionModel;

  final Function(AppNavActions action) onItemClick;

  const DashboardItem(
      {Key? key, required this.actionModel, required this.onItemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onItemClick(actionModel.action);
      },
      child: Container(

        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),border: Border.all(color: AppColors.primary)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center
            ,
            children: [
              SvgPicture.asset(
                actionModel.icon,
                height: 20,
                color: AppColors.primary,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                actionModel.title,
                style: const TextStyle(color: AppColors.primary, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
