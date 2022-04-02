import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatNotAvailable extends StatelessWidget {
  const ChatNotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColors.greyLightest,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Spacer(
              flex: 1,
            ),
            SvgPicture.asset(
              AppImages.icMessage,
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              AppConstants.msgNoChatAvailable,
              style: TextStyle(fontSize: 17),
              textAlign: TextAlign.center,
            ),
            Spacer(flex: 2),
            CustomBtn(
                title: "Book Appointment",
                onBtnPressed: () {
                  Navigator.pushReplacementNamed(context, "/addNewAppointment");
                },
                isLoading: false),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    ));
  }
}
