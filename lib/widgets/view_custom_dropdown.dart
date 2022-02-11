import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ViewCustomDropDown extends StatefulWidget {
  const ViewCustomDropDown({Key? key}) : super(key: key);

  @override
  _ViewCustomDropDownState createState() => _ViewCustomDropDownState();
}

class _ViewCustomDropDownState extends State<ViewCustomDropDown> {
  String? selectedValue;
  final List<String> ageItems = [
    '5-10',
    '11-18',
    '19-25',
    '26-32',
    '33-40',
    '41-45',
    '46-52',
  ];


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: const Text(
        'Select Your Age Group',

      ),
      icon: SvgPicture.asset(AppImages.icArrowDown,color: AppColors.greyBefore,height: 10,),
      buttonHeight: 30,
      buttonPadding: const EdgeInsets.only( right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      items: ageItems
          .map((item) =>
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select age group.';
        }
      },
      onChanged: (value) {
        //Do something when changing the item if you want.
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
    );
  }
}
