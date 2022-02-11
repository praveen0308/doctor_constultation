import 'package:doctor_consultation/user/patient/profile/profile_body.dart';
import 'package:doctor_consultation/user/patient/profile/profile_header.dart';
import 'package:doctor_consultation/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientProfilePage extends StatefulWidget {
  const PatientProfilePage({Key? key}) : super(key: key);

  @override
  _PatientProfilePageState createState() => _PatientProfilePageState();
}

class _PatientProfilePageState extends State<PatientProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ListView(
              children: [
                ProfileHeader(),
                ProfileBody()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
