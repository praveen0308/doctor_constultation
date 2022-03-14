import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_users_state.dart';

class ManageUsersCubit extends Cubit<ManageUsersState> {
  ManageUsersCubit() : super(ManageUsersInitial());
}
