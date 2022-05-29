import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'doctor_appointment_history_state.dart';

class DoctorAppointmentHistoryCubit
    extends Cubit<DoctorAppointmentHistoryState> {
  final AppointmentRepository _appointmentRepository;

  DoctorAppointmentHistoryCubit(this._appointmentRepository)
      : super(DoctorAppointmentHistoryInitial());
  late String selectedDate;
  final List<AppointmentDetailModel> appointments = [];
  int selectedStatus = 0;
  int selectedDateFilter = 0;
  void getAppointmentsByDate(DateTime date) async {
    selectedDate = DateFormat("yyyy-MM-dd").format(date);
    emit(OnDateSelected(date));
    emit(Loading());
    try {
      List<AppointmentDetailModel> response = await _appointmentRepository
          .fetchAllAppointmentDetailsByDate(selectedDate);
      appointments.clear();
      appointments.addAll(response);
      filterAppointmentByStatus(selectedStatus);
      // emit(ReceivedAppointments(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void filterAppointmentByStatus(int status) {
    selectedStatus = status;
    List<AppointmentDetailModel> filteredItems = [];
    for (var appointment in appointments) {
      switch (selectedStatus) {
        case 0:
          {
            if (appointment.AppointmentStatusID == AppConstants.pending ||
                appointment.AppointmentStatusID == AppConstants.approved ||
                appointment.AppointmentStatusID == AppConstants.ongoing) {
              filteredItems.add(appointment);
            }
          }
          break;
        case 1:
          {
            if (appointment.AppointmentStatusID == AppConstants.closed) {
              filteredItems.add(appointment);
            }
          }
          break;
        case 2:
          {
            if (appointment.AppointmentStatusID == AppConstants.cancelled) {
              filteredItems.add(appointment);
            }
          }
          break;
      }
    }

    emit(ReceivedAppointments(filteredItems));
  }

  void applyDateFilter(int filter) {
    selectedDateFilter = filter;
    var startDay = DateTime.now();
    var noOfDays = 30;
    switch (filter) {
      case 0:
        {
          // next 30 days
          var newDate = DateTime(startDay.year, startDay.month, startDay.day);
          emit(ReceivedDates(newDate, noOfDays));
        }
        break;
      case 1:
        {
          // last week

          var newDate =
              DateTime(startDay.year, startDay.month, startDay.day - 7);
          noOfDays = 7;
          emit(ReceivedDates(newDate, noOfDays));
        }
        break;

      case 2:
        {
          // last month
          var newDate =
              DateTime(startDay.year, startDay.month - 1, startDay.day);
          noOfDays = 30;
          emit(ReceivedDates(newDate, noOfDays));
        }
        break;

      case 3:
        {
          // last 3 months
          var newDate =
              DateTime(startDay.year, startDay.month - 3, startDay.day);
          noOfDays = 90;
          emit(ReceivedDates(newDate, noOfDays));
        }
        break;

      case 4:
        {
          // custom
          emit(ChooseDateRange());
        }
        break;
    }
  }

  void selectedDateRange(DateTimeRange range) {
    var diff = range.end.difference(range.start);
    emit(ReceivedDates(range.start, diff.inDays));
  }

  void startSession(int appointmentId, String meetingID) async {
    emit(StartingSession());
    try {
      bool response = await _appointmentRepository.updateAppointmentStatus(
          appointmentId, AppConstants.ongoing,
          meetingId: meetingID);
      if (response) {
        emit(SessionStarted());
        getAppointmentsByDate(DateTime.parse(selectedDate));
      } else {
        emit(Error("Failed to start session!!!"));
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

  void cancelAppointment(int appointmentId) async {
    emit(CancellingAppointment());
    try {
      bool response = await _appointmentRepository.updateAppointmentStatus(
          appointmentId, AppConstants.cancelled);
      if (response) {
        emit(AppointmentCancelled());
        getAppointmentsByDate(DateTime.parse(selectedDate));
      } else {
        emit(Error("Failed!!"));
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
