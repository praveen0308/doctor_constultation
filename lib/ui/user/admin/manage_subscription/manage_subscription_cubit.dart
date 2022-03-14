import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_subscription_state.dart';

class ManageSubscriptionCubit extends Cubit<ManageSubscriptionState> {
  ManageSubscriptionCubit() : super(ManageSubscriptionInitial());
}
