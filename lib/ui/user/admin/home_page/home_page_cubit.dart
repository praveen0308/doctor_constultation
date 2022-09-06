import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/stat_model.dart';
import 'package:doctor_consultation/models/statistics_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/util_repository.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {

  HomePageCubit() : super(HomePageInitial());


}
