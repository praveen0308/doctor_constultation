import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'appointment_page_state.dart';

class AppointmentPageCubit extends Cubit<AppointmentPageState> {
  AppointmentPageCubit() : super(AppointmentPageInitial());
}
