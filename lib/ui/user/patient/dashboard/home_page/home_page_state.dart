part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class LoadingVideos extends HomePageState {}

class ReceivedVideos extends HomePageState {
  final List<VideoModel> videos;

  ReceivedVideos(this.videos);
}

class Error extends HomePageState {
  final String msg;

  Error(this.msg);
}
