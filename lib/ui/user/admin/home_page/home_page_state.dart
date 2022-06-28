part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class LoadingTodayAppointments extends HomePageState {}
class LoadingStats extends HomePageState {}
class ReceivedStats extends HomePageState {
  final List<StatisticsModel> stats;

  ReceivedStats(this.stats);

}

class Error extends HomePageState {
  final String msg;

  Error(this.msg);
}

class ReceivedAppointments extends HomePageState {
  final List<AppointmentDetailModel> appointments;
  int completed = 0;
  int total = 0;
  int remaining = 0;
  ReceivedAppointments(this.appointments);

  void calculateAppointments() {
    for (var a in appointments) {
      switch (a.AppointmentStatusID) {
        case AppConstants.pending:
          {
            remaining += 1;
          }
          break;
        case AppConstants.approved:
          {
            remaining += 1;
          }
          break;
        case AppConstants.cancelled:
          {
            completed += 1;
          }
          break;
        case AppConstants.ongoing:
          {
            remaining += 1;
          }
          break;
        case AppConstants.closed:
          {
            completed += 1;
          }
          break;
      }
      total += 1;
    }
  }
}
