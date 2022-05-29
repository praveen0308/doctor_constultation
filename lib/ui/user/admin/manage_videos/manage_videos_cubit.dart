import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/util_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'manage_videos_state.dart';

class ManageVideosCubit extends Cubit<ManageVideosState> {
  final UtilRepository _utilRepository;
  final _storage = SecureStorage();
  ManageVideosCubit(this._utilRepository) : super(ManageVideosInitial());
  void getUserRole() async {
    var roleId = await _storage.getUserRoleId();
    emit(ReceivedRoleId(roleId));
    getAllVideos();
  }

  void getAllVideos() async {
    emit(Loading());
    try {
      List<VideoModel> response = await _utilRepository.fetchAllVideos();
      emit(ReceivedVideos(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void deleteVideo(int videoId) async {
    emit(Loading());
    try {
      bool response = await _utilRepository.deleteVideoById(videoId);
      if (response) {
        emit(DeletedSuccessfully());
      } else {
        emit(Error("Unable to delete video!!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
