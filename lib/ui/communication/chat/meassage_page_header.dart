import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/search_patient_filter.dart';
import 'package:flutter/cupertino.dart';

class TemplateMessagePageHeader extends StatelessWidget {
  final String firstLine;
  final String secondLine;
  final bool isSearch;
  const TemplateMessagePageHeader(
      {Key? key,
      this.firstLine = "Let’s Consult",
      this.secondLine = "With Patients",
      this.isSearch = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstLine,
          style: AppTextStyle.headline6(txtColor: AppColors.primary),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          secondLine,
          style: AppTextStyle.headline5(txtColor: AppColors.greyDark),
        ),
        Visibility(
          visible: isSearch,
          child: ViewSearchPatientFilter(
            onTextUpdated: (String text) {},
          ),
        )
      ],
    );
  }
}
