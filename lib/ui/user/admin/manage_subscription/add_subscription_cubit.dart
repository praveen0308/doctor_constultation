import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_subscription_state.dart';

class AddSubscriptionCubit extends Cubit<AddSubscriptionState> {
  AddSubscriptionCubit() : super(AddSubscriptionInitial());
}
