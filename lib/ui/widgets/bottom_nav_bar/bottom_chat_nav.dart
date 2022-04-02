import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TemplateBottomChatNav extends StatefulWidget {
  final Function(String msg) onSend;

  const TemplateBottomChatNav({Key? key, required this.onSend})
      : super(key: key);

  @override
  State<TemplateBottomChatNav> createState() => _TemplateBottomChatNavState();
}

class _TemplateBottomChatNavState extends State<TemplateBottomChatNav> {
  String msg = "";
  late TextEditingController _editingController;

  // final

  @override
  void initState() {
    _editingController = TextEditingController(text: msg);
    _editingController.selection =
        TextSelection.fromPosition(TextPosition(offset: msg.length));
    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      width: MediaQuery.of(context).size.width,
      color: AppColors.greyLightest,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.icAttachment)),
          Expanded(
            child: TextFormField(
              controller: _editingController,
              onChanged: (txt) {
                setState(() {
                  msg = txt;
                });
              },
              onFieldSubmitted: (txt) {
                setState(() {
                  msg = txt;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  fillColor: AppColors.greyLightest,
                  hintText: 'Type a message...',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16)),
              keyboardType: TextInputType.text,
            ),
          ),
          // IconButton(onPressed: (){}, icon: SvgPicture.asset(AppImages.icUnMuteMic)),

          RawMaterialButton(
            onPressed: () {
              if (msg.isNotEmpty) {
                widget.onSend(msg);

                _editingController.text = "";
                setState(() {
                  msg = "";
                });
              } else {
                showToast("Type something...", ToastType.warning);
              }
            },
            elevation: 2.0,
            fillColor: msg.isNotEmpty ? AppColors.primary : AppColors.grey,
            child: Center(
              child: Icon(
                Icons.send,
                size: 24.0,
                color: msg.isNotEmpty ? Colors.white : Colors.grey,
              ),
            ),
            shape: const CircleBorder(),
          )
        ],
      ),
    );
  }
}
