import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TemplateBottomChatNav extends StatelessWidget {
  const TemplateBottomChatNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      color: AppColors.greyLightest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.icAttachment)),
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),

                ),
                fillColor: AppColors.greyLightest,
                hintText: 'Type a message...',
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.icUnMuteMic)),
        ],
      ),
    );
  }
}
