import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class ViewSearchPatientFilter extends StatelessWidget {
  const ViewSearchPatientFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: TextField(
          onTap: () => Navigator.pushNamed(context, route.layoutSearchFilterPatient),
          decoration: InputDecoration(
              prefixIcon: IconButton(
                icon: SvgPicture.asset(AppImages.icSearchPrimary,height: 22),
                onPressed: () {
                  /* Clear the search field */
                },
              ),
              suffixIcon: IconButton(
                icon: SvgPicture.asset(AppImages.icFilterPrimary,height: 15),
                onPressed: () {
                  /* Clear the search field */
                },
              ),
              hintText: 'Search Patients...',
              border: InputBorder.none),
        ),
      ),
    );
  }
}
