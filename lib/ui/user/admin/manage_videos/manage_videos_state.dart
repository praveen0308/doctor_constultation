part of 'manage_videos_cubit.dart';

@immutable
abstract class ManageVideosState {}

class ManageVideosInitial extends ManageVideosState {}

class Loading extends ManageVideosState {}

class ReceivedRoleId extends ManageVideosState {
  final int roleId;

  ReceivedRoleId(this.roleId);
}

class DeletedSuccessfully extends ManageVideosState {}

class Error extends ManageVideosState {
  final String msg;

  Error(this.msg);
}

class ReceivedVideos extends ManageVideosState {
  final List<VideoModel> videos;

  ReceivedVideos(this.videos);
}
