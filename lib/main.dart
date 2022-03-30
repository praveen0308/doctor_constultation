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
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/add_new_appointment.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/add_new_appointment_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_patient/add_patient_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
