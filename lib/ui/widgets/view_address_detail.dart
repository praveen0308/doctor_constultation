import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAddressDetail extends StatelessWidget {
  final String txtTitle;
  final String txtSubTitle;

  const ViewAddressDetail({
    Key? key,
    this.txtTitle = "Title",
    this.txtSubTitle = "SubTitle",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                    color: AppColors.greyLight,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2 + 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              txtTitle,
                              style: AppTextStyle.captionRF1(
                                  txtColor: AppColors.greyDark,
                                  wFont: FontWeight.w500),
                            ),
                            Text(
                              txtSubTitle,
                              style: AppTextStyle.captionRF2(
                                  txtColor: AppColors.greyBefore,
                                  wFont: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                      child: Icon(
                        Icons.more_vert,
                        color: AppColors.greyBefore,
                      ),
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
