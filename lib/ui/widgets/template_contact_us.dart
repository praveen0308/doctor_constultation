import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/ui/widgets/template_ic_text1.dart';
import 'package:flutter/cupertino.dart';

class TemplateContactUs extends StatelessWidget {
  const TemplateContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TemplateICText(
              imgURL: AppImages.icClinicPrimary,
              txtTitle: "Address",
              txtSubTitle: AppStrings.clinicAddress,
              txtCaption: AppStrings.clinicPlace,
              txtTColor: AppColors.greyBefore,
            ),
            SizedBox(
              height: 15,
            ),
            TemplateICText(
              imgURL: AppImages.icSchedulePrimary,
              txtTitle: "Availability",
              txtSubTitle: "Monaday - Saturday,",
              txtCaption: AppStrings.clinicTiming,
              txtTColor: AppColors.greyBefore,
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 210,
            width: 117,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage(AppImages.imgMap),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
