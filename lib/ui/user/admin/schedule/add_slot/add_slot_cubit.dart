import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/slot_model.dart';
import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'add_slot_state.dart';

class AddSlotCubit extends Cubit<AddSlotState> {
  final AppointmentRepository _appointmentRepository;
  AddSlotCubit(this._appointmentRepository) : super(AddSlotInitial());

  void createSlot(SlotModel slotModel) async{
    emit(Loading());
    try{
      bool response = await _appointmentRepository.createUpdateSlotDetail(slotModel);
      if(response){
        emit(Success());
      }
      else{
        emit(Error("Failed!!"));
      }

    }on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");

    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }
}
