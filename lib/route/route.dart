import 'package:doctor_consultation/models/api/appointment_detail_model.dart';
import 'package:doctor_consultation/models/api/schedule_model.dart';
import 'package:doctor_consultation/models/api/video_model.dart';
import 'package:doctor_consultation/repository/account_repository.dart';
import 'package:doctor_consultation/repository/appointment_repository.dart';
import 'package:doctor_consultation/repository/case_repository.dart';
import 'package:doctor_consultation/repository/communication_repository.dart';
import 'package:doctor_consultation/repository/patient_repository.dart';
import 'package:doctor_consultation/repository/schedule_repository.dart';
import 'package:doctor_consultation/repository/transaction_repository.dart';
import 'package:doctor_consultation/repository/util_repository.dart';
import 'package:doctor_consultation/ui/common/login/login.dart';
import 'package:doctor_consultation/ui/common/register/register.dart';
import 'package:doctor_consultation/ui/common/enter_user_detail/enter_user_detail.dart';
import 'package:doctor_consultation/ui/common/phone_auth/phone_auth_cubit.dart';
import 'package:doctor_consultation/ui/common/phone_auth/enter_mobile_number.dart';
import 'package:doctor_consultation/ui/common/phone_auth/verify_otp_page.dart';
import 'package:doctor_consultation/ui/common/splash_screen.dart';
import 'package:doctor_consultation/ui/common/success_view.dart';
import 'package:doctor_consultation/ui/common/welcome_user_type.dart';
import 'package:doctor_consultation/ui/communication/chat_screen/chat_screen.dart';
import 'package:doctor_consultation/ui/communication/chat_screen/chat_screen_cubit.dart';
import 'package:doctor_consultation/ui/communication/user_patient_chats/chat_not_available.dart';
import 'package:doctor_consultation/ui/doctor/dr_profile.dart';
import 'package:doctor_consultation/ui/image_viewer/image_viewer.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info.dart';
import 'package:doctor_consultation/ui/user/add_case_info/add_case_info_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/appointment_detail.dart';
import 'package:doctor_consultation/ui/user/admin/appointment/past_appointment.dart';
import 'package:doctor_consultation/ui/user/admin/appointment/patient_past_appointment_detail.dart';
import 'package:doctor_consultation/ui/user/admin/appointment_detail/appointment_detail_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/communication/payment_detail.dart';
import 'package:doctor_consultation/ui/user/admin/dashboard/dashboard.dart';
import 'package:doctor_consultation/ui/user/admin/manage_videos/manage_videos.dart';
import 'package:doctor_consultation/ui/user/admin/manage_videos/manage_videos_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/add_slot/add_new_slot.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/create_new_schedule/create_new_schedule_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/manage_slots/manage_slot.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/set_schedule.dart';
import 'package:doctor_consultation/ui/user/admin/schedule/view_schedule/view_schedule.dart';
import 'package:doctor_consultation/ui/user/admin/search_patient/search_patient.dart';
import 'package:doctor_consultation/ui/user/admin/search_patient/search_patient_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/search_user/search_user.dart';
import 'package:doctor_consultation/ui/user/admin/search_user/search_user_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/transactions/transaction_history.dart';
import 'package:doctor_consultation/ui/user/admin/transactions/transaction_history_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/upload_videos/upload_video.dart';
import 'package:doctor_consultation/ui/user/admin/upload_videos/upload_video_cubit.dart';
import 'package:doctor_consultation/ui/user/admin/user_appointments/user_appointments.dart';
import 'package:doctor_consultation/ui/user/admin/user_appointments/user_appointments_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_address/add_update_address.dart';
import 'package:doctor_consultation/ui/user/patient/add_address/add_update_address_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/add_patient/add_patient.dart';
import 'package:doctor_consultation/ui/user/patient/add_patient/add_patient_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/appointment/new_appointment.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/dashboard.dart';
import 'package:doctor_consultation/ui/user/patient/dashboard/patient_profile_page.dart';
import 'package:doctor_consultation/ui/user/patient/manage_patients/manage_patients.dart';
import 'package:doctor_consultation/ui/user/patient/manage_patients/manage_patients_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/notification/patient_notification.dart';

import 'package:doctor_consultation/ui/user/patient/profile/my_addresses/user_addresses.dart';
import 'package:doctor_consultation/ui/user/patient/profile/my_addresses/user_addresses_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/profile/personal_data/personal_data.dart';
import 'package:doctor_consultation/ui/user/patient/profile/personal_data/personal_data_cubit.dart';
import 'package:doctor_consultation/ui/user/patient/purchase_subscription_plan/purchase_subscription_plan.dart';
import 'package:doctor_consultation/ui/user/patient/purchase_subscription_plan/purchase_subscription_plan_cubit.dart';
import 'package:doctor_consultation/ui/user/patient_detail/patient_detail.dart';
import 'package:doctor_consultation/ui/user/patient_detail/patient_detail_cubit.dart';
import 'package:doctor_consultation/ui/user/user_detail/user_detail.dart';
import 'package:doctor_consultation/ui/user/user_detail/user_detail_cubit.dart';
import 'package:doctor_consultation/ui/user_notifications/user_notifications.dart';
import 'package:doctor_consultation/ui/video_player/video_player.dart';
import 'package:doctor_consultation/ui/video_player/youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../ui/add_new_appointment/add_new_appointment.dart';
import '../ui/add_new_appointment/add_new_appointment_cubit.dart';
import '../ui/user/admin/schedule/create_new_schedule/create_new_schedule.dart';
import '../ui/user_notifications/user_notifications_cubit.dart';

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
const String searchUser = '/searchUser';

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
const String addCaseInfo = '/addCaseInfo';
const String appointmentDetailForPatient = '/appointmentDetailForPatient';
const String uploadVideo = '/uploadVideo';
const String managePatients = '/managePatients';
const String manageVideos = '/manageVideos';
const String manageUsers = '/manageUsers';
const String purchaseSubscriptionPlan = '/purchaseSubscriptionPlan';
const String videoPlayer = '/videoPlayer';
const String youtubePlayer = '/youtubePlayer';
const String userDetails = '/userDetails';
const String patientDetails = '/patientDetails';
const String chatScreen = '/chatScreen';
const String imageViewer = '/imageViewer';
const String chatNotAvailable = '/chatNotAvailable';
const String personalData = '/personalData';
const String transactions = '/transactions';
const String searchPatients = '/searchPatients';
const String userAppointments = '/userAppointments';

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
    case uploadVideo:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => UploadVideoCubit(UtilRepository()),
                child: UploadVideo(
                  videoModel: args as VideoModel,
                ),
              ),
          settings: settings);
    case addNewAppointment:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => AddNewAppointmentCubit(
                    AppointmentRepository(), AccountRepository()),
                child: AddNewAppointment(),
              ),
          settings: settings);

    case purchaseSubscriptionPlan:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => PurchaseSubscriptionPlanCubit(
                    AccountRepository(),
                    TransactionRepository(),
                    AppointmentRepository()),
                child: PurchaseSubscriptionPlan(
                  args: args as PurchaseSubscriptionPlanArgs,
                ),
              ),
          settings: settings);
    case addPatientInfo:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => AddPatientCubit(PatientRepository(),AccountRepository()),
                child: AddPatientInfo(),
              ),
          settings: settings);
    case addCaseInfo:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => AddCaseInfoCubit(CaseRepository()),
                child: AddCaseInfo(
                  caseInfoArgs: args as AddCaseInfoArgs,
                ),
              ),
          settings: settings);
    case addUpdateAddress:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => AddUpdateAddressCubit(PatientRepository()),
                child: AddUpdateAddress(),
              ),
          settings: settings);

    case managePatients:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => ManagePatientsCubit(PatientRepository()),
                child: const ManagePatients(),
              ),
          settings: settings);
    case addSlot:
      return MaterialPageRoute(
          builder: (context) => AddNewSlot(), settings: settings);
    case manageSetSlots:
      return MaterialPageRoute(
          builder: (context) => LayoutSetSchedule(), settings: settings);
    case chatScreen:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => ChatScreenCubit(),
                child: ChatScreen(
                  args: args as ChatScreenArgs,
                ),
              ),
          settings: settings);

    case imageViewer:
      return MaterialPageRoute(
          builder: (context) => ImageViewer(
            images: args as List<String>,
          ),
          settings: settings);
    case transactions:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => TransactionHistoryCubit(TransactionRepository()), child: TransactionHistory(),
          ),
          settings: settings);
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
          builder: (context) => BlocProvider(
                create: (context) =>
                    AppointmentDetailCubit(AppointmentRepository()),
                child: AppointmentDetailPage(
                  appointmentId: args as int,
                ),
              ),
          settings: settings);

    case searchUser:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => SearchUserCubit(AccountRepository()),
                child: SearchUser(),
              ),
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
    case patientProfilePage:
      return MaterialPageRoute(
          builder: (context) => const PatientProfilePage(), settings: settings);
    case createNewSchedule:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                CreateNewScheduleCubit(AppointmentRepository(), ScheduleRepository()),
            child: CreateNewSchedule(args: args as CreateNewScheduleArgs),
          ),
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
          builder: (context) => BlocProvider(
            create: (context) => UserNotificationsCubit(CommunicationRepository()),
            child: const UserNotifications(),
          ),
          settings: settings);

    case drProfilePage:
      return MaterialPageRoute(
          builder: (context) => const DrProfilePage(), settings: settings);

    case layoutUserType:
      return MaterialPageRoute(
          builder: (context) => const LayoutUserType(), settings: settings);

    case successPage:
      return MaterialPageRoute(
          builder: (context) => SuccessPage(
                args: args as SuccessPageArgs,
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
    case searchPatients:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => SearchPatientCubit(PatientRepository()),
            child: SearchPatient(),
          ));
    case manageVideos:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => ManageVideosCubit(UtilRepository()),
                child: ManageVideos(),
              ),
          settings: settings);

    case videoPlayer:
      return MaterialPageRoute(
          builder: (context) => VideoPlayer(videoUrl: args as String),
          settings: settings);
    case youtubePlayer:
      return MaterialPageRoute(
          builder: (context) => MyYoutubePlayer(videoUrl: args as String),
          settings: settings);
    case chatNotAvailable:
      return MaterialPageRoute(
          builder: (context) => ChatNotAvailable(), settings: settings);
    case userDetails:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) =>
                    UserDetailCubit(AccountRepository(), PatientRepository()),
                child: UserDetailScreen(userID: args as int),
              ),
          settings: settings);
    case patientDetails:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) =>
                    PatientDetailCubit(PatientRepository(), CaseRepository()),
                child: PatientDetailScreen(patientId: args as int),
              ),
          settings: settings);
    case personalData:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (context) => PersonalDataCubit(AccountRepository()),
                child: const PersonalData(),
              ),
          settings: settings);
    case userAppointments:
      return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => UserAppointmentsCubit(AppointmentRepository()),
            child: UserAppointments(userID: args as int,),
          ),
          settings: settings);

    default:
      throw ('this route name does not exist');
  }
}
