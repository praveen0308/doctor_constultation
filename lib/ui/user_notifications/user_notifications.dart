import 'package:doctor_consultation/ui/user_notifications/user_notifications_cubit.dart';
import 'package:doctor_consultation/ui/widgets/loading_view.dart';
import 'package:doctor_consultation/ui/widgets/no_records_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/card/notification_view.dart';

class UserNotifications extends StatefulWidget {
  const UserNotifications({Key? key}) : super(key: key);

  @override
  State<UserNotifications> createState() => _UserNotificationsState();
}

class _UserNotificationsState extends State<UserNotifications> {

  late UserNotificationsCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = BlocProvider.of<UserNotificationsCubit>(context);
    _cubit.fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: BlocBuilder<UserNotificationsCubit, UserNotificationsState>(
        builder: (context, state) {
          if(state is Error){
            return NoRecordsView(title: state.error, onBtnClick: (){
              _cubit.fetchNotifications();
            },requiredBtn: true,btnText: "Reload",);
          }

          if(state is NoNotifications){
            return NoRecordsView(title: "No notifications !!!", onBtnClick: (){
              _cubit.fetchNotifications();
            },requiredBtn: true,btnText: "Reload",);
          }
          if(state is ReceivedUserNotifications){
            return ListView.builder(itemCount: state.notifications.length,itemBuilder: (_,index){
              var notification = state.notifications[index];
              return NotificationView(notificationModel: notification,);
            });
          }
          return const LoadingView(isVisible: true);
        },
      ),
    );
  }
}
