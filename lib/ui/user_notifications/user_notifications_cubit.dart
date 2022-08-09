import 'package:bloc/bloc.dart';
import 'package:doctor_consultation/models/api/notification_model.dart';
import 'package:doctor_consultation/repository/communication_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../network/utils/network_exceptions.dart';

part 'user_notifications_state.dart';

class UserNotificationsCubit extends Cubit<UserNotificationsState> {

  final CommunicationRepository _communicationRepository;
  UserNotificationsCubit(this._communicationRepository) : super(UserNotificationsInitial());

  void fetchNotifications() async {
    emit(LoadingNotifications());
    try {
      List<NotificationModel> response = await _communicationRepository.fetchNotificationsByReceiverID();
      if (response.isNotEmpty) {
        emit(ReceivedUserNotifications(response));
      } else {
        emit(NoNotifications());
      }
    } on NetworkExceptions catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    } on Exception catch (e) {
      emit(Error("Something went wrong !!!"));
      debugPrint("Exception >>> $e");
    }
  }

}
