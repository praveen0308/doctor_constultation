import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropDown extends StatefulWidget {
  final String hint;
  final bool isOutlined;
  final List<dynamic> itemList;
  final Function(dynamic) onItemSelected;

  const CustomDropDown(
      {Key? key,
      required this.hint,
      required this.itemList,
      required this.onItemSelected,
      this.isOutlined = false})
      : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  dynamic selectedDocument;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: widget.isOutlined
            ? BorderRadius.circular(5)
            : BorderRadius.circular(0),
        border: widget.isOutlined
            ? Border.all(color: AppColors.primary, width: 2.0)
            : Border(bottom: BorderSide(color: AppColors.primary, width: 2.0)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<dynamic>(
          icon: SvgPicture.asset(AppImages.icArrowDown),
          iconEnabledColor: AppColors.primary,
          value: selectedDocument,
          isExpanded: true,
          items: widget.itemList.map(buildDropDownMenuItem).toList(),
          onChanged: (value) {
            widget.onItemSelected(value);
            setState(() {
              selectedDocument = value!;
            });
          },
          hint: Text(widget.hint),
        ),
      ),
    );
  }
}

DropdownMenuItem<dynamic> buildDropDownMenuItem(dynamic item) =>
    DropdownMenuItem(
        value: item,
        child: Text(
          item.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ));
