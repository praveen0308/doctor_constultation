import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/search_patient_filter.dart';
import 'package:flutter/cupertino.dart';

class TemplateMessagePageHeader extends StatelessWidget {
  const TemplateMessagePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let’s Consult",
          style: AppTextStyle.headline6(txtColor: AppColors.primary),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "With Patients",
          style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
        ),
        ViewSearchPatientFilter()
      ],
    );
  }
}
