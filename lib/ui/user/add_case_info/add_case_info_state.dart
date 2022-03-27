part of 'add_case_info_cubit.dart';

@immutable
abstract class AddCaseInfoState {}

class AddCaseInfoInitial extends AddCaseInfoState {}

class Loading extends AddCaseInfoState {}

class AddedSuccessfully extends AddCaseInfoState {}

class FilesUpdated extends AddCaseInfoState {}

class UploadingDocument extends AddCaseInfoState {
  final int fileIndex;
  UploadingDocument(this.fileIndex);
}

class DocumentUploaded extends AddCaseInfoState {
  final int fileIndex;
  DocumentUploaded(this.fileIndex);
}

class Error extends AddCaseInfoState {
  final String msg;

  Error(this.msg);
}
