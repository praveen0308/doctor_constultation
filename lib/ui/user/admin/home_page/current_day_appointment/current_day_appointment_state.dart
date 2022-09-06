part of 'current_day_appointment_cubit.dart';

@immutable
abstract class CurrentDayAppointmentState {}

class CurrentDayAppointmentInitial extends CurrentDayAppointmentState {}
class LoadingAppointments extends CurrentDayAppointmentState {}


class ReceivedCachedAppointments extends CurrentDayAppointmentState {
  final List<int> data;

  ReceivedCachedAppointments(this.data);

}


class Error extends CurrentDayAppointmentState {
  final String msg;

  Error(this.msg);
}

class ReceivedAppointments extends CurrentDayAppointmentState {
  final List<AppointmentDetailModel> appointments;
  int completed = 0;
  int total = 0;
  int remaining = 0;
  ReceivedAppointments(this.appointments);

  List<int> calculateAppointments() {
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

    return [completed,remaining,total];
  }
}
