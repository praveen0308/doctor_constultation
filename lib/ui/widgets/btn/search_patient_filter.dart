import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:doctor_consultation/route/route.dart' as route;

class ViewSearchPatientFilter extends StatefulWidget {
  final bool isDisabled;
  final Function(String text) onTextUpdated;
  final Function()? onClick;
  const ViewSearchPatientFilter({
    Key? key,
    required this.onTextUpdated,
    this.isDisabled = false,
    this.onClick,
  }) : super(key: key);

  @override
  State<ViewSearchPatientFilter> createState() =>
      _ViewSearchPatientFilterState();
}

class _ViewSearchPatientFilterState extends State<ViewSearchPatientFilter> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: const BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: TextField(
            enabled: !widget.isDisabled,
            controller: TextEditingController()
              ..text = text
              ..selection =
                  TextSelection.fromPosition(TextPosition(offset: text.length)),
            onChanged: (txt) {
              setState(() {
                text = txt;
                widget.onTextUpdated(txt);
              });
            },
            onSubmitted: (txt) {
              setState(() {
                text = txt;
                widget.onTextUpdated(txt);
              });
            },

            textInputAction: TextInputAction.search,

            // Navigator.pushNamed(context, route.layoutSearchFilterPatient),
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  icon: SvgPicture.asset(AppImages.icSearchPrimary, height: 22),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                suffixIcon: Visibility(
                  visible: text.isNotEmpty,
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        text = "";
                        widget.onTextUpdated(text);
                      });
                    },
                  ),
                ),
                hintText: 'Search ...',
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
