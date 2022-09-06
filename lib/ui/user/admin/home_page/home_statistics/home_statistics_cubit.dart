import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../local/app_storage.dart';
import '../../../../../models/api/stat_model.dart';
import '../../../../../models/statistics_model.dart';
import '../../../../../network/utils/network_exceptions.dart';
import '../../../../../repository/util_repository.dart';
import '../../../../../util/app_constants.dart';

part 'home_statistics_state.dart';

class HomeStatisticsCubit extends Cubit<HomeStatisticsState> {
  final UtilRepository _utilRepository;
  final _storage =SecureStorage();

  HomeStatisticsCubit(this._utilRepository) : super(HomeStatisticsInitial());


  void getHomeStatistics() async {
    emit(LoadingStats());
    try {
      StatModel? statModel = await _storage.getStats();

      if(statModel !=null){
        List<StatisticsModel> stats = [];
        stats.add(StatisticsModel(title: "Users",stat: statModel.Users!, action:AppNavActions.manageUsers));
        stats.add(StatisticsModel(title: "Patients",stat: statModel.Patient!, action:AppNavActions.managePatients));
        stats.add(StatisticsModel(title: "Appointments",stat: statModel.Appointment!, action:AppNavActions.appointments));
        stats.add(StatisticsModel(title: "Videos",stat: statModel.Video!, action:AppNavActions.manageVideos));

        emit(ReceivedStats(stats));
      }
      StatModel response = await _utilRepository.getStats();
      _storage.updateStats(response);
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
