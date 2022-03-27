import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:flutter/material.dart';

part 'add_case_info_state.dart';

class AddCaseInfoCubit extends Cubit<AddCaseInfoState> {
  final CaseRepository _caseRepository;
  final List<File> files = [];
  AddCaseInfoCubit(this._caseRepository) : super(AddCaseInfoInitial());
  void addCaseInfo(CaseInfoModel caseInfoModel) async {
    emit(Loading());
    try {
      int response = await _caseRepository.createUpdateCaseInfo(caseInfoModel);
      if (response!=0) {
        emit(AddedSuccessfully());
        uploadAttachments(response,"N/A",files);
      } else {
        emit(Error("Failed to add case!!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void addFile(File file) {
    files.add(file);
    emit(FilesUpdated());
  }

  void addFiles(List<File> files) {
    this.files.addAll(files);
    emit(FilesUpdated());
  }

  void removeFile(int index) {
    files.removeAt(index);
    emit(FilesUpdated());
  }

  void uploadAttachments(
    int caseInfoId, String comment,
    List<File> files
  ) async {
    files.asMap().forEach((index, file) async {
      emit(UploadingDocument(index));
      try {
        String response = await _caseRepository.uploadCaseDocument(
            caseInfoId,
            comment,
            file.path,
            "${DateTime.now()}.${file.path.split('/').last}");
        if (response.isNotEmpty) {
          emit(DocumentUploaded(index));
        } else {
          emit(Error("Failed to upload ${file.path}!!!"));
          debugPrint("Upload failed at index $index");
        }
      } on NetworkExceptions catch (e) {
        emit(Error("Something went wrong !!!"));
        debugPrint("Exception >>> $e");
      } on Exception catch (e) {
        emit(Error("Something went wrong !!!"));
        debugPrint("Exception >>> $e");
      }
    });
  }
}
