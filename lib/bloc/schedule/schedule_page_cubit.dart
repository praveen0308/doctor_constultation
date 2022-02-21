import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'schedule_page_state.dart';

class SchedulePageCubit extends Cubit<SchedulePageState> {
  SchedulePageCubit() : super(SchedulePageInitial());
}
