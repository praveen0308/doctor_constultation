import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/models/batch_model.dart';
import 'package:doctor_consultation/repository/schedule_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../network/utils/network_exceptions.dart';
import '../../../../../util/date_time_helper.dart';

part 'view_schedule_state.dart';

class ViewScheduleCubit extends Cubit<ViewScheduleState> {
  final ScheduleRepository _scheduleRepository;

  ViewScheduleCubit(this._scheduleRepository) : super(ViewScheduleInitial());

  void fetchSlotsByDate(String date) async {
    emit(Loading());
    try {
      List<ScheduleModel> response =
          await _scheduleRepository.getAvailableSlotsByDate(date);

      emit(ReceivedAvailableSlots(response));
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
