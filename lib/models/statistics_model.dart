import 'package:doctor_consultation/util/app_constants.dart';

class StatisticsModel{
  String title;
  int stat;
  String? icon;
  AppNavActions? action;

  StatisticsModel({required this.title,required this.stat, this.action});
}