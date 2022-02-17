import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:meta/meta.dart';

part 'dashboard_page_state.dart';

class DashboardPageCubit extends Cubit<DashboardPageState> {
  final _storage = SecureStorage();

  DashboardPageCubit() : super(DashboardPageInitial());
}
