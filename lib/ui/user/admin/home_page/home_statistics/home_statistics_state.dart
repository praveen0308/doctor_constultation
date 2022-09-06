part of 'home_statistics_cubit.dart';

@immutable
abstract class HomeStatisticsState {}

class HomeStatisticsInitial extends HomeStatisticsState {}
class LoadingStats extends HomeStatisticsState {}


class ReceivedStats extends HomeStatisticsState {
  final List<StatisticsModel> stats;

  ReceivedStats(this.stats);

}


class Error extends HomeStatisticsState {
  final String msg;

  Error(this.msg);
}