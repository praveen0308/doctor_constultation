import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/case_info_model.dart';
import 'package:meta/meta.dart';

part 'patient_case_history_state.dart';

class PatientCaseHistoryCubit extends Cubit<PatientCaseHistoryState> {
  PatientCaseHistoryCubit() : super(PatientCaseHistoryInitial());
}
