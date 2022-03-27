import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/util_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final UtilRepository _utilRepository;
  HomePageCubit(this._utilRepository) : super(HomePageInitial());

  void getAllVideos() async {
    emit(LoadingVideos());
    try {
      List<VideoModel> response = await _utilRepository.fetchAllVideos();
      List<VideoModel> videos = [];
      if (response.length > 8) {
        videos.addAll(response.take(8));
      } else {
        videos.addAll(response);
      }
      emit(ReceivedVideos(videos));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
