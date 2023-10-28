// ignore_for_file: ,

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/provider/DoctorDetailsProvider.dart';
import 'package:smile_and_go_app/provider/appointment_Provider.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/provider/favoritedoctorprovider.dart';
import 'package:smile_and_go_app/provider/profileprovider.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/view/screen/ArticleScreens/ArticleScreensActivity.dart';
import 'package:smile_and_go_app/view/screen/ChatScreen/chatPages/chat_list_view.dart';
import 'package:smile_and_go_app/view/screen/ReviewScreens/DoctorChatReviewScreen/DoctorChatReviewScreen.dart';
import 'package:smile_and_go_app/view/screen/ReviewScreens/DoctorChatReviewScreen/writeareviewScreen.dart';
import 'package:smile_and_go_app/view/screen/ReviewScreens/ReviewScreensActivity.dart';
import 'package:smile_and_go_app/view/screen/SettingsScreen/components/WebviewWidgetUIScreen.dart';
import 'package:smile_and_go_app/view/screen/SettingsScreen/helpcenterScreen.dart';
import 'package:smile_and_go_app/view/screen/SettingsScreen/settingscreenActivity.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/TreatmentScreenActivity.dart';
import 'package:smile_and_go_app/view/screen/doctor/doctorDetails.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/bottomdashborad.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/favoritedoctorlist.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/notification.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/topdoctorlistshow.dart';
import 'package:smile_and_go_app/view/screen/introscreen/OnBoardingScreen/onboarding_screen.dart';
import 'package:smile_and_go_app/view/screen/introscreen/SplashScreen.dart';
import 'package:smile_and_go_app/view/screen/introscreen/languageselectscreen.dart';
import 'package:smile_and_go_app/view/screen/introscreen/welcomescreen.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/changenewpassword.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/changepassword.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/forgotpassword.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/loginscreen.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/loginselectScreen.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/otpcodeverification.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/signupscreen.dart';
import 'package:smile_and_go_app/view/screen/profileScreen/editProfileScreenActivity.dart';
import 'package:smile_and_go_app/view/screen/profileScreen/profileScreenActivity.dart';
import 'package:smile_and_go_app/view/screen/rescheduleAppointment/RecheduleAppointmentBooking.dart';
import 'package:smile_and_go_app/view/screen/rescheduleAppointment/cancelAppointment.dart';
import 'package:smile_and_go_app/view/screen/rescheduleAppointment/rescheduleAppointment.dart';
import 'package:smile_and_go_app/view/screen/rescheduleAppointment/rescheduleAppointmentdate.dart';
import 'package:smile_and_go_app/view/screen/rescheduleAppointment/viewAppointmentScreen.dart';
import 'package:smile_and_go_app/view/screen/searchScreen/searchScreenActivity.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    Widget widgetScreen;
    switch (settings.name) {

      case Routes.splashScreen:
        widgetScreen = SplashScreenACtivity();
        break;
      case Routes.changeLanguageScreen:
        widgetScreen = LanguageSelectScreenActivity();
        break;
      case Routes.onboardingScreen:
        widgetScreen = const OnboardingScreen();
        break;
      case Routes.welcomeScreen:
        widgetScreen = const WelcomeScreenActivity();
        break;
      case Routes.loginintroScreen:
        widgetScreen = LoginSelectScreenActivity();
        break;
      case Routes.signupscreen:
        widgetScreen = SignupScreenActivity();
        break;
      case Routes.loginScreen:
        widgetScreen = LoginScreenActivity();
        break;
      case Routes.forgetPassword:
        widgetScreen = ForgotPassword();
        break;
      case Routes.otpVerify:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = OtpVerify(
          pagetype: args[AppStringFile.pagetype],
          email: args[AppStringFile.email],
        );
        break;
      case Routes.changenewPassword:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangenewPasswordScreenActivity(
          userid: args[AppStringFile.userid],
          email: args[AppStringFile.email],
          otp: args[AppStringFile.otp],
          callback: args[AppStringFile],
        );
        break;

      // case Routes.otpVerify:
      //   widgetScreen = OtpVerificationScreenActivity();
      //   break;
      // case Routes.otpVerify:
      //   Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      //   widgetScreen = OtpVerify(
      //     email: args[AppStringFile.email],
      //   );
      // break;

      case Routes.changePassword:
        widgetScreen = ChangePasswordScreenActivity();
        break;
      case Routes.dashBoardScreenActivity:
        widgetScreen = DashBoardScreenActivity();
        break;
      case Routes.topdoctor:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: TopDoctorScreenActivity(
              locationId: args[AppStringFile.locationId],
            ));
        break;

      case Routes.favoriteDoctorList:
        widgetScreen = ChangeNotifierProvider<FavoritedoctorProvider>(
            create: (BuildContext context) => FavoritedoctorProvider(),
            child: FavoriteDoctorListScreenActivity(
              type: '',
            ));
        break;

      case Routes.notification:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: NotificationScreeenActivity());
        break;

      case Routes.doctordetails:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<DoctorDetailsProvider>(
          create: (BuildContext context) => DoctorDetailsProvider(),
          child: DoctorDetailsScreenActivity(
            doctordetails: args[AppStringFile.doctordetails],
            doctorName: args[AppStringFile.doctorName],
          ),
        );
        break;

      // case Routes.doctordetails:
      //   Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      //   widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
      //     create: (BuildContext context) => DashBoradProvider(),
      //     child: DoctorDetailsScreenActivity(
      //       doctordetails: args[AppStringFile.doctordetails],
      //       doctorName: args[AppStringFile.doctorName],
      //     ),
      //   );
      //   break;
      // case Routes.doctordetails:
      //   widgetScreen = DoctorDetailsScreenActivity();
      //   break;

      case Routes.profileScreenActivity:
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: ProfileScreenActivity());
        break;
      case Routes.editProfile:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
            create: (BuildContext context) => ProfileUserProvider(),
            child: EditProfile(
              profileuserdata: args[AppStringFile.profileuserdata],
            ));
        break;
      case Routes.rescheduleAppointment:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = RescheduleAppointment(
          bookingId: args[AppStringFile.bookingId],
          bookingDate: args[AppStringFile.bookingDate],
          bookingTime: args[AppStringFile.bookingTime],
          doctorId: args[AppStringFile.doctorId],
        );

        break;
      case Routes.cancelAppointment:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = CancelAppointment(
          bookingId: args[AppStringFile.bookingId],
        );

        break;
      case Routes.rescheduleAppointmentDate:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<AppointmentServices>(
            create: (BuildContext context) => AppointmentServices(),
            child: RescheduleAppointmentDate(
              doctordetails: args[AppStringFile.doctordetails],
            ));
        break;
      case Routes.recheduleAppointmentBooking:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ChangeNotifierProvider<AppointmentServices>(
            create: (BuildContext context) => AppointmentServices(),
            child: RecheduleAppointmentBooking(
              bookingId: args[AppStringFile.bookingId],
              bookingDate: args[AppStringFile.bookingDate],
              bookingTime: args[AppStringFile.bookingTime],
              doctorId: args[AppStringFile.doctorId],
            ));
        break;
      case Routes.treatmentScreenActivity:
        widgetScreen = TreatmentScreenActivity();
        break;

      // Web urls
      case Routes.webviewWidgetUIScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = WebviewWidgetUIScreen(
          url: args[AppStringFile.url],
          text: args[AppStringFile.title],
        );
        break;
      case Routes.settingScreenActivity:
        widgetScreen = SettingScreenActivity();
        break;
      case Routes.searchScreentActivity:
        widgetScreen = ChangeNotifierProvider<DashBoradProvider>(
            create: (BuildContext context) => DashBoradProvider(),
            child: SearchScreentActivity());
        break;
      case Routes.chattinglistScreenActivity:
        widgetScreen = ChattinglistScreenActivity();
        break;
      case Routes.articleScreenActivity:
        widgetScreen = ArticleScreenActivity();
        break;
      case Routes.viewAppointmentScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        widgetScreen = ViewAppointmentScreen(
          doctordetails: args[AppStringFile.doctordetails],
          bookingResponse: args[AppStringFile.bookingResponse],
        );
        break;
      case Routes.helpCenterScreenActivity:
        widgetScreen = HelpCenterScreenActivity();
        break;
      case Routes.reviewScreensActivity:
        widgetScreen = ReviewScreensActivity();
        break;
      case Routes.chatSessionEndScreenACtivity:
        widgetScreen = ChatSessionEndScreenACtivity();
        break;
      case Routes.writeaReviewScreenACtivity:
        widgetScreen = WriteaReviewScreenACtivity();
        break;

      //  case Routes.settingScreenActivity:
      // widgetScreen = ChangeNotifierProvider<ProfileUserProvider>(
      //     create: (BuildContext context) => ProfileUserProvider(),
      //     child: SettingScreenActivity());
      // break;

      default:
        widgetScreen = SplashScreenACtivity();
    }
    return PageRouteBuilder(
        settings: settings,
        pageBuilder: (_, __, ___) => widgetScreen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  static Widget _errorRoute() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error'),
      ),
      body: Center(
        child: Text('ERROR'),
      ),
    );
  }
}
