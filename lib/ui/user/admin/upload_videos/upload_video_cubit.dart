import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/util_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'upload_video_state.dart';

class UploadVideoCubit extends Cubit<UploadVideoState> {
  final UtilRepository _utilRepository;
  UploadVideoCubit(this._utilRepository) : super(UploadVideoInitial());

  void uploadVideoDetail(VideoModel videoModel) async {
    emit(Uploading());
    try {
      bool response = await _utilRepository.createUpdateVideoDetail(videoModel);
      if (response) {
        emit(UploadedSuccessfully());
      } else {
        emit(Error("Failed to upload!!!"));
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
