import 'package:flutter/material.dart';

class AppointmentCaseInfo extends StatefulWidget {
  /// case id equal to will be considered as no case info added by user
  final int caseID;
  const AppointmentCaseInfo({Key? key, required this.caseID}) : super(key: key);

  @override
  State<AppointmentCaseInfo> createState() => _AppointmentCaseInfoState();
}

class _AppointmentCaseInfoState extends State<AppointmentCaseInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
