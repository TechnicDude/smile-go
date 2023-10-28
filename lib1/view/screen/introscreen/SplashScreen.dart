import 'dart:async';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_and_go_app/api/locdb.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';

class SplashScreenACtivity extends StatefulWidget {
  const SplashScreenACtivity({super.key});

  @override
  State<SplashScreenACtivity> createState() => _SplashScreenACtivityState();
}

class _SplashScreenACtivityState extends State<SplashScreenACtivity> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, homePageRoute);
  }

  homePageRoute() async {
    String? onboardingScreen;
    await LocDb().isLoggedIn();
    bool check = await LocDb().loginapp;

    SharedPreferences preferences = await SharedPreferences.getInstance();
    onboardingScreen =
        preferences.getString(AppStringFile.onboardingScreen).toString();

    if (check) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.dashBoardScreenActivity, (Route<dynamic> route) => false);
    } else {
      if (onboardingScreen != "0") {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.changeLanguageScreen, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Image.asset(
              AppImages.applogo,
              width: 60.w,
              height: 20.h,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [LoaderScreennew()],
          ),
        ],
      )),
    );
  }
}
