part of 'case_attachments_cubit.dart';

@immutable
abstract class CaseAttachmentsState {}

class CaseAttachmentsInitial extends CaseAttachmentsState {}
class LoadingCaseAttachments extends CaseAttachmentsState {}
class NoCaseAttachments extends CaseAttachmentsState {}
class ReceivedCaseAttachments extends CaseAttachmentsState {
  final List<CaseDocModel> caseAttachments;

  ReceivedCaseAttachments(this.caseAttachments);
}
class Error extends CaseAttachmentsState {
  final String msg;

  Error(this.msg);
}
