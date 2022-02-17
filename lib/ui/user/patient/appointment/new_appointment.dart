import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:flutter/material.dart';

import 'new_appointment_body.dart';

class NewAppointment extends StatefulWidget {
  const NewAppointment({Key? key}) : super(key: key);

  @override
  _NewAppointmentState createState() => _NewAppointmentState();
}

class _NewAppointmentState extends State<NewAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: NewAppointmentBody(),
        ),
      ),
    );
  }
}
