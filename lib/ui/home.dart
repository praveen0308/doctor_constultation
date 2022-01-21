import 'package:doctor_consultation/widgets/app_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        body: ListView(
          children: const <Widget>[
            AppNavBar(),

          ],
        ),
      ),
    );
  }
}
