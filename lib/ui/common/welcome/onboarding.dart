import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/widgets/app_nav_bar/app_back_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppOnboarding extends StatefulWidget {
  const AppOnboarding({Key? key}) : super(key: key);

  @override
  _AppOnboardingState createState() => _AppOnboardingState();
}

class _AppOnboardingState extends State<AppOnboarding> {
  late PageController _tabsPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabsPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AppBackNavBar(imgUrl: AppImages.icBackArrow,navColor: AppColors.primary,bgColor: AppColors.greyLight,)
          ],
        ),
      ),
    );
  }
}
