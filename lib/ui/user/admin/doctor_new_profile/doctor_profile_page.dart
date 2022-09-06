
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile_body.dart';
import 'profile_header.dart';

class DoctorProfilePage extends StatefulWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {
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
