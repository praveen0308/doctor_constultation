import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'subscription_plan_page_state.dart';

class SubscriptionPlanPageCubit extends Cubit<SubscriptionPlanPageState> {
  SubscriptionPlanPageCubit() : super(SubscriptionPlanPageInitial());
}
