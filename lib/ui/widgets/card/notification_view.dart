import 'package:doctor_consultation/models/api/notification_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../res/app_colors.dart';
import '../../../res/style_text.dart';

class NotificationView extends StatelessWidget {
  final NotificationModel notificationModel;
  const NotificationView({Key? key, required this.notificationModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      margin: const EdgeInsets.only(bottom: 16,left: 16,right: 16),


      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primaryLightest
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notificationModel.Title.toString(),
            style: AppTextStyle.subtitle1(
                txtColor: AppColors.greyDark),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            notificationModel.Description.toString(),
            style: AppTextStyle.subtitle2(
                txtColor: AppColors.greyBefore),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Spacer(),
              Text(notificationModel.getNotificationTiming().toString(),)
            ],
          )
        ],
      ),
    );
  }
}
