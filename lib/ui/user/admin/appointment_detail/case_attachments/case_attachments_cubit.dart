import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/case_doc_model.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../network/utils/network_exceptions.dart';

part 'case_attachments_state.dart';

class CaseAttachmentsCubit extends Cubit<CaseAttachmentsState> {
  final CaseRepository _caseRepository;
  CaseAttachmentsCubit(this._caseRepository) : super(CaseAttachmentsInitial());


  void getCaseAttachments(int caseID) async {
    emit(LoadingCaseAttachments());
    try {
      List<CaseDocModel> response = await _caseRepository.fetchCaseAttachments(caseID);
      if (response.isNotEmpty) {
        emit(ReceivedCaseAttachments(response));
      } else {
        emit(NoCaseAttachments());
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
