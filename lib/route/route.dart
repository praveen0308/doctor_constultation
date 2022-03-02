import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:doctor_consultation/ui/common/login/login.dart';
import 'package:doctor_consultation/ui/common/register/register.dart';
import 'package:doctor_consultation/ui/common/enter_user_detail/enter_user_detail.dart';
import 'package:doctor_consultation/ui/common/phone_auth/phone_auth_cubit.dart';
import 'package:doctor_consultation/ui/common/phone_auth/enter_mobile_number.dart';
import 'package:doctor_consultation/ui/common/phone_auth/verify_otp_page.dart';
import 'package:doctor_consultation/ui/common/splash_screen.dart';
import 'package:doctor_consultation/ui/common/success_view.dart';
import 'package:doctor_consultation/ui/common/welcome_user_type.dart';
import 'package:doctor_consultation/ui/doctor/dr_profile.dart';
import 'package:doctor_consultation/ui/user/admin/appointment/appointment_detail.dart';
import 'package:doctor_consultation/ui/user/admin/appointment/past_appointment.dart';
import 'package:doctor_consultation/ui/user/admin/appointment/patient_past_appointment_detail.dart';
import 'package:doctor_consultation/ui/user/admin/communication/payment_detail.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/dashboard.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/add_schedule/create_new_schedule.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/add_slot/add_new_slot.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/manage_slots/manage_slot.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/set_schedule.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/view_schedule/view_schedule.dart';
import 'package:doctor_consultation/ui/user/admin/search_patient/search_filter_patient.dart';
import 'package:doctor_consultation/ui/user/patient/add_address/add_update_address.dart';
import 'package:doctor_consultation/ui/user/patient/add_address/add_update_address_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/add_new_appointment.dart';
import 'package:doctor_consultation/ui/user/patient/add_new_appointment/add_new_appointment_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_patient/add_patient.dart';
import 'package:doctor_consultation/ui/user/patient/add_patient/add_patient_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/appointment/new_appointment.dart';
import 'package:doctor_consultation/ui/user/patient/communication/chat_with_doctor/main_chat.dart';
import 'package:doctor_consultation/ui/user/patient/communication/video_call/main_video_call.dart';
import 'package:doctor_consultation/ui/user/patient/communication/voice_call/main_voice_call.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/dashboard.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/message_page.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/patient_profile_page.dart';
import 'package:doctor_consultation/ui/user/patient/notification/patient_notification.dart';
import 'package:doctor_consultation/ui/user/patient/profile/my_addresses/user_addresses.dart';
import 'package:doctor_consultation/ui/user/patient/profile/my_addresses/user_addresses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// importing our pages into our route.dart

// variable for our route names
const String splashScreen = '/';
const String enterMobileNumber = '/enterMobileNumber';
const String dashboardPatient = '/dashboardPatient';
const String verifyOtp = '/verifyOtp';
const String dashboardDoctor = '/dashboardDoctor';
const String enterUserDetails = '/enterUserDetails';
const String appointmentDetailPage = '/appointmentDetailPage';
const String layoutSearchFilterPatient = '/layoutSearchFilterPatient';

//Bottom Nav
const String newAppointment = '/newAppointment';
const String manageSetSlots = '/manageSetSlots';
const String manageSlots = '/manageSlots';
const String addSlot = '/addSlot';
const String messagePage = '/messagePage';
const String patientsMessages = '/patientsMessages';
const String patientProfilePage = '/patientProfilePage';

//Admin
const String patientPastAppointmentDetailPage =
    '/patientPastAppointmentDetailPage';
const String layoutPastAppointment = '/layoutPastAppointment';
const String layoutPaymentConfirmation = '/layoutPaymentConfirmation';

const String notificationPage = '/notificationPage';
const String createNewSchedule = '/createNewSchedule';

const String drProfilePage = '/drProfilePage';
const String mainVoiceCall = '/mainVoiceCall';
const String mainVideoCall = '/mainVideoCall';

const String layoutUserType = '/layoutUserType';

const String successPage = '/successPage';
const String login = '/login';
const String register = '/register';
const String viewSchedule = '/viewSchedule';
const String addNewAppointment = '/addNewAppointment';
const String addPatientInfo = '/addPatientInfo';
const String addUpdateAddress = '/addUpdateAddress';
const String userAddresses = '/userAddresses';

// controller function with switch statement to control page route flow
Route<dynamic> controller(RouteSettings settings) {
  final args = settings.arguments;
  switch (settings.name) {
    case splashScreen:
      return MaterialPageRoute(
          builder: (context) => const SplashScreen(), settings: settings);
    case enterMobileNumber:
      return MaterialPageRoute(
          builder: (context) => const EnterMobileNumber(), settings: settings);

    case verifyOtp:
      return MaterialPageRoute(
          builder: (context) => VerifyOtpPage(), settings: settings);
    case manageSlots:
      return MaterialPageRoute(
          builder: (context) => ManageSlot(), settings: settings);
    case viewSchedule:
      return MaterialPageRoute(
          builder: (context) => ViewSchedule(), settings: settings);
    case addNewAppointment:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) =>
                    AddNewAppointmentCubit(AppointmentRepository()),
                child: AddNewAppointment(),
              ),
          settings: settings);
    case addPatientInfo:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => AddPatientCubit(PatientRepository()),
                child: AddPatientInfo(),
              ),
          settings: settings);
    case addUpdateAddress:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => AddUpdateAddressCubit(PatientRepository()),
                child: AddUpdateAddress(),
              ),
          settings: settings);
    case addSlot:
      return MaterialPageRoute(
          builder: (context) => AddNewSlot(), settings: settings);
    case manageSetSlots:
      return MaterialPageRoute(
          builder: (context) => LayoutSetSchedule(), settings: settings);
    case patientsMessages:
      return MaterialPageRoute(
          builder: (context) => MainChatPage(), settings: settings);
    case enterUserDetails:
      return MaterialPageRoute(
          builder: (context) => EnterUserDetail(), settings: settings);
    case dashboardPatient:
      return MaterialPageRoute(
          builder: (context) => const DashboardPatient(), settings: settings);
    case dashboardDoctor:
      return MaterialPageRoute(
          builder: (context) => const DashboardAdmin(), settings: settings);
    case appointmentDetailPage:
      return MaterialPageRoute(
          builder: (context) => const AppointmentDetailPage(),
          settings: settings);
    case layoutSearchFilterPatient:
      return MaterialPageRoute(
          builder: (context) => const LayoutSearchFilterPatient(),
          settings: settings);

    case newAppointment:
      return MaterialPageRoute(
          builder: (context) => const NewAppointment(), settings: settings);
    case login:
      return MaterialPageRoute(
          builder: (context) => const LoginPage(), settings: settings);
    case register:
      return MaterialPageRoute(
          builder: (context) => const RegisterPage(), settings: settings);
    case messagePage:
      return MaterialPageRoute(
          builder: (context) => const MessagePage(), settings: settings);
    case patientProfilePage:
      return MaterialPageRoute(
          builder: (context) => const PatientProfilePage(), settings: settings);
    case createNewSchedule:
      return MaterialPageRoute(
          builder: (context) => CreateNewSchedule(scheduleDate: args as String),
          settings: settings);

    case patientPastAppointmentDetailPage:
      return MaterialPageRoute(
          builder: (context) => const PatientPastAppointmentDetailPage(),
          settings: settings);
    case layoutPastAppointment:
      return MaterialPageRoute(
          builder: (context) => const LayoutPastAppointment(),
          settings: settings);

    case notificationPage:
      return MaterialPageRoute(
          builder: (context) => const NotificationPage(), settings: settings);

    case drProfilePage:
      return MaterialPageRoute(
          builder: (context) => const DrProfilePage(), settings: settings);

    case mainVoiceCall:
      return MaterialPageRoute(
          builder: (context) => const MainVoiceCall(), settings: settings);

    case mainVideoCall:
      return MaterialPageRoute(
          builder: (context) => const MainVideoCall(), settings: settings);
    case layoutUserType:
      return MaterialPageRoute(
          builder: (context) => const LayoutUserType(), settings: settings);

    case successPage:
      return MaterialPageRoute(
          builder: (context) => SuccessPage(
                scheduleModel: args as ScheduleModel,
              ),
          settings: settings);
    case layoutPaymentConfirmation:
      return MaterialPageRoute(
          builder: (context) => const LayoutPaymentConfirmation(),
          settings: settings);
    case userAddresses:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => UserAddressesCubit(AccountRepository()),
                child: UserAddresses(),
              ),
          settings: settings);

    default:
      throw ('this route name does not exist');
  }
}
