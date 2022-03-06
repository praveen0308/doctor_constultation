part of 'upload_video_cubit.dart';

@immutable
abstract class UploadVideoState {}

class UploadVideoInitial extends UploadVideoState {}
class Uploading extends UploadVideoState {}
class Error extends UploadVideoState {
  final String msg;
  Error(this.msg);
}

class UploadedSuccessfully extends UploadVideoState {}
