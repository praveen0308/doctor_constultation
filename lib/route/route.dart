import 'package:doctor_consultation/common/splash_screen.dart';
import 'package:doctor_consultation/user/admin/dashboard/dashboard.dart';
import 'package:doctor_consultation/user/patient/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

// importing our pages into our route.dart

// variable for our route names
const String splashScreen = '/';
const String dashboardPatient = '/dashboardPatient';
const String dashboardDoctor = '/dashboardDoctor';

// controller function with switch statement to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(), settings: settings);

    case dashboardPatient:
      return MaterialPageRoute(
          builder: (context) => const DashboardPatient(), settings: settings);
    case dashboardDoctor:
      return MaterialPageRoute(
          builder: (context) => const DashboardAdmin(), settings: settings);
    default:
      throw ('this route name does not exist');
  }
}
