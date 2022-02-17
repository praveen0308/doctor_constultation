import 'dart:io';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItem {
  int? id;
  String headerName;
  String description;
  bool isExpanded;

  ListItem({
    this.id,
    required this.headerName,
    required this.description,
    this.isExpanded = false,
  });
}

List<ListItem> generateItems(int numberOfItems) {
  return List<ListItem>.generate(numberOfItems, (int index) {
    return ListItem(
      id: index,
      headerName: 'FAQ $index',
      description: 'This is body of item number $index',
    );
  });
}

List<ExpansionPanel> _getExpansionPanels(List<ListItem> _items) {
  return _items.map<ExpansionPanel>((ListItem item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(item.headerName,style: AppTextStyle.subtitle1(txtColor: AppColors.greyDark,wFont: FontWeight.w500),),
        );
      },
      body: ListTile(
        title: Text(item.description),
      ),
      isExpanded: item.isExpanded,
    );
  }).toList();
}

class HelpUsBodyPage extends StatefulWidget {
  @override
  _HelpUsBodyPageState createState() {
    return _HelpUsBodyPageState();
  }
}

class _HelpUsBodyPageState extends State<HelpUsBodyPage> {
  List<ListItem> _items = generateItems(15);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        animationDuration: Duration(milliseconds: 1000),
        children: _getExpansionPanels(_items),
        expansionCallback: (panelIndex, isExpanded) {
          _items[panelIndex].isExpanded = !isExpanded;
          setState(() {

          });
        },
        expandedHeaderPadding: EdgeInsets.symmetric(vertical: 2),
      ),
    );
  }
}
