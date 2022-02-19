import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/local/app_storage.dart';
import 'package:doctor_consultation/models/api/user_model.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:meta/meta.dart';

part 'user_auth_bloc_state.dart';

class UserAuthBlocCubit extends Cubit<UserAuthBlocState> {
  final _storage = SecureStorage();
  final AccountRepository accountRepository;
  UserAuthBlocCubit(this.accountRepository) : super(UserAuthBlocInitial());

  void addUpdateUserDetails(UserModel userModel) async {
    emit(UserAuthBlocLoading());
    try {
      var result = await accountRepository.addUpdateUserDetails(userModel);
      if (result) {
        emit(UserAuthBlocRegistrationDone());
      } else {
        emit(UserAuthBlocRegistrationFailed());
      }
    } catch (e) {}
  }
}
