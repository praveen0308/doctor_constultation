import 'package:doctor_consultation/ui/user/patient/dashboard/appointment_history/patient_appointment_history_cubit.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:doctor_consultation/repository/schedule_repository.dart';
import 'package:doctor_consultation/ui/common/login/login_cubit.dart';
import 'package:doctor_consultation/ui/common/phone_auth/phone_auth_cubit.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/route/route.dart' as route;
import 'package:doctor_consultation/ui/common/register/register_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/add_schedule/create_new_schedule_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/add_slot/add_slot_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/manage_slots/manage_slot_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/view_schedule/view_schedule_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();


    // 1. This method call when app in terminated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method

    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          // LocalNotificationService.display(message);

        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.greyLightest,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.greyLightest,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: AppColors.greyLight));
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PhoneAuthCubit(AccountRepository())),
        BlocProvider(
            create: (_) =>
                PatientAppointmentHistoryCubit(AppointmentRepository())),
        BlocProvider(create: (_) => LoginCubit(AccountRepository())),
        BlocProvider(create: (_) => RegisterCubit(AccountRepository())),
        BlocProvider(create: (_) => ManageSlotCubit(AppointmentRepository())),
        BlocProvider(create: (_) => AddSlotCubit(AppointmentRepository())),
        BlocProvider(create: (_) => ViewScheduleCubit(ScheduleRepository())),
        // BlocProvider(create: (_) => AddPatientCubit(PatientRepository())),

        BlocProvider(
            create: (_) => CreateNewScheduleCubit(
                AppointmentRepository(), ScheduleRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: AppColors.primarySwatchColor,
            scaffoldBackgroundColor: AppColors.greyLightest,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(
                color: AppColors.primary,
              ),
              titleTextStyle: TextStyle(
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            )),
        initialRoute: route.splashScreen,
        onGenerateRoute: route.controller,
      ),
    );
  }
}
