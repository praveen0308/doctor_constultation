import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_discount_state.dart';

class AddDiscountCubit extends Cubit<AddDiscountState> {
  AddDiscountCubit() : super(AddDiscountInitial());
}
