import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_clinics_state.dart';

class ManageClinicsCubit extends Cubit<ManageClinicsState> {
  ManageClinicsCubit() : super(ManageClinicsInitial());
}
