import 'package:doctor_consultation/network/utils/network_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState<T> with _$ResultState<T> {
  const factory ResultState.idle() = Idle<T>;

  const factory ResultState.loading() = Loading<T>;

  const factory ResultState.data(T data) = Data<T>;

  const factory ResultState.error(NetworkExceptions error) = Error<T>;
}
