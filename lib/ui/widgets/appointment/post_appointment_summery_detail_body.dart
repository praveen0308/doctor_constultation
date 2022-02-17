import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/app_string.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/view_heading_appointment.dart';
import 'package:doctor_consultation/ui/widgets/view_medicine_detail.dart';
import 'package:doctor_consultation/ui/widgets/view_my_rich_text.dart';
import 'package:doctor_consultation/ui/widgets/view_text_cost.dart';
import 'package:doctor_consultation/ui/widgets/view_treatment_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TemplatePastAppointmentSummeryBodyDetail extends StatelessWidget {
  const TemplatePastAppointmentSummeryBodyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15),
        // margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            color: AppColors.greyLightest,
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryLight,
                blurRadius: 10.0,
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            const ViewHeadingAppointment(
              imgURL: AppImages.icTreatmentSummery,
              txtTitle: AppStrings.treatment,
              txtSubTitle: "11 Meetings",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ViewTreatmentTimeline(
                txtSr: "1",
                txtTitle: "Consultation",
                txtSubTitle: "id: DS-TI41563 ",
                txtDate: "Mon, Jan 03",
                txtTiming: "09:30 AM",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ViewTreatmentTimeline(
                txtSr: "2",
                txtTitle: "Video call",
                txtSubTitle: "id: DS-TI15542",
                txtDate: "Sun, Jan 02",
                txtTiming: "09:30 AM",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ViewTreatmentTimeline(
                txtSr: "3",
                txtTitle: "Clinic visit",
                txtSubTitle: "id: DS-TI30563",
                txtDate: "Sat, Jan 01",
                txtTiming: "09:30 AM",
              ),
            ),
            Text(
              "See all",
              style: AppTextStyle.overlieRF1(
                  txtColor: AppColors.primary, wFont: FontWeight.w500),
            ),
            const ViewHeadingAppointment(
              imgURL: AppImages.icDescriptionSummery,
              txtTitle: AppStrings.description,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.primaryLightest,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ashjbdbhhd",
                          style: AppTextStyle.subtitle1(
                              txtColor: AppColors.greyDark),
                        ),
                        Text(
                          "ashjbdbhhd",
                          style: AppTextStyle.subtitle1(
                              txtColor: AppColors.greyDark),
                        ),
                        Text(
                          "ashjbdbhhd",
                          style: AppTextStyle.subtitle1(
                              txtColor: AppColors.greyDark),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const ViewHeadingAppointment(
              imgURL: AppImages.icMedicineSummery,
              txtTitle: AppStrings.medicine,
              txtSubTitle: "2 Tablets",
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ViewMedicineSummery(
                txtQty: "2x",
                txtMedicine: "Tablet",
                txtUnit: "100mg",
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: ViewMedicineSummery(
                txtQty: "1x",
                txtMedicine: "Capsule",
                txtUnit: "100mg",
              ),
            ),
            const ViewHeadingAppointment(
                imgURL: AppImages.icPaymentSummery,
                txtTitle: AppStrings.payment),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ViewMyRichText(
                    text1: "Payment",
                    text2: "Method",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.imgRuPay,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ViewMyRichText(
                        text1: "RuPay Card",
                        text2: " XXXXX - 8921",
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ViewMyRichText(
                    text1: "Treatment",
                    text2: "Cost",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.primaryLightest,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Consultation",
                                txtCost: "Free",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Video Call",
                                txtCost: "₹200",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Clinic Visit",
                                txtCost: "₹300",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Video Call",
                                txtCost: "₹200",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Clinic Visit",
                                txtCost: "₹300",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Video Call",
                                txtCost: "₹200",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Clinic Visit",
                                txtCost: "₹300",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Clinic Visit",
                                txtCost: "₹300",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: ViewTextCost(
                                txtTitle: "Clinic Visit",
                                txtCost: "₹300",
                              ),
                            ),
                          ],
                        )),
                  ),
                  const Divider(
                    color: AppColors.primaryLight,
                    thickness: 1.2,
                  ),
                  ViewMyRichText(
                    text1: "Medicine",
                    text2: " Cost",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.primaryLightest,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5),
                            child: ViewTextCost(
                              txtTitle: "3x Capsule",
                              txtCost: "₹80",
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5),
                            child: ViewTextCost(
                              txtTitle: "1x Tablet",
                              txtCost: "₹20",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.primaryLight,
                    thickness: 1.2,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColors.primaryLightest,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Total Cost",style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark,wFont: FontWeight.w500),),
                                  Text("₹2200",style: AppTextStyle.headline6(txtColor: AppColors.primary,wFont: FontWeight.w700),),

                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
