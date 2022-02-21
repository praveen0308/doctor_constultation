import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_appointment_page_state.dart';

class NewAppointmentPageCubit extends Cubit<NewAppointmentPageState> {
  NewAppointmentPageCubit() : super(NewAppointmentPageInitial());
}
