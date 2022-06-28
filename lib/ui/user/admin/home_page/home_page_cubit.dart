import 'package:bloc/bloc.dart';
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
  final AppointmentRepository _appointmentRepository;
  final UtilRepository _utilRepository;
  HomePageCubit(this._appointmentRepository, this._utilRepository) : super(HomePageInitial());

  void getAppointmentsByDate() async {
    emit(LoadingTodayAppointments());
    try {
      List<AppointmentDetailModel> response =
          await _appointmentRepository.fetchAllAppointmentDetailsByDate(
              DateTimeHelper.getCurrentDate(format: "yyyy-MM-dd"));
      var ra = ReceivedAppointments(response);
      ra.calculateAppointments();
      emit(ra);
      Future.delayed(const Duration(milliseconds: 500)).then((value) =>getHomeStatistics());

    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void getHomeStatistics() async {
    emit(LoadingStats());
    try {
      StatModel response = await _utilRepository.getStats();
      
      List<StatisticsModel> stats = [];
      stats.add(StatisticsModel(title: "Users",stat: response.Users!, action:AppNavActions.manageUsers));
      stats.add(StatisticsModel(title: "Patients",stat: response.Patient!, action:AppNavActions.managePatients));
      stats.add(StatisticsModel(title: "Appointments",stat: response.Appointment!, action:AppNavActions.appointments));
      stats.add(StatisticsModel(title: "Videos",stat: response.Video!, action:AppNavActions.manageVideos));

      emit(ReceivedStats(stats));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
