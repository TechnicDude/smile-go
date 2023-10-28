import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/loginapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/components/socialloginbutton.dart';

class LoginSelectScreenActivity extends StatefulWidget {
  const LoginSelectScreenActivity({super.key});

  @override
  State<LoginSelectScreenActivity> createState() =>
      _LoginSelectScreenActivityState();
}

class _LoginSelectScreenActivityState extends State<LoginSelectScreenActivity> {
  bool isLoading = false;

  // SOCIAL LOGIN AUTHENTICATION

  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    print("googleAuth $googleAuth");
    log(googleAuth!.idToken.toString());

    googlelogin(googleAuth.idToken.toString());
  }

  googlelogin(String token) async {
    var data = {
      'token': token,
    };
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.googlesocialmedialogin();
    if (response['status'] == 'true') {
      Map<String, dynamic> res = response['user'];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      AppHelper.userid = res['id'].toString();
      AppHelper.email_VALUE = res['email'].toString();
      AppHelper.AUTH_TOKEN_VALUE = response['accessToken'].toString();
      sharedPreferences.setString(AppStringFile.userid, res['id'].toString());
      sharedPreferences.setString(AppStringFile.email, res['email'].toString());
      sharedPreferences.setString(
          AppStringFile.authtoken, response['accessToken'].toString());
      String? token;
      try {
        token = (await FirebaseMessaging.instance.getToken())!;
        print(token);
      } catch (e) {
        print(e);
      }
      var body = {"facId": token};
      LoginApi responsefcmtoken = LoginApi(body);
      final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
      print(responsefcmtokenreturn);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashBoardScreenActivity, (route) => false);
      DialogHelper.showFlutterToast(strMsg: "Login Successful");
    }
  }

  facebooklogin(String token) async {
    var data = {
      'token': token,
    };
    print(data.toString());
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.facebooksocialmedialogin();
    if (response['status'] == 'success') {
      Map<String, dynamic> res = response['user'];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      AppHelper.userid = res['id'].toString();
      AppHelper.email_VALUE = res['email'].toString();
      AppHelper.AUTH_TOKEN_VALUE = response['accessToken'].toString();
      sharedPreferences.setString(AppStringFile.userid, res['id'].toString());
      sharedPreferences.setString(AppStringFile.email, res['email'].toString());
      sharedPreferences.setString(
          AppStringFile.authtoken, response['accessToken'].toString());
      String? token;
      try {
        token = (await FirebaseMessaging.instance.getToken())!;
        print(token);
      } catch (e) {
        print(e);
      }
      var body = {"facId": token};
      LoginApi responsefcmtoken = LoginApi(body);
      final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
      print(responsefcmtokenreturn);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashBoardScreenActivity, (route) => false);
      DialogHelper.showFlutterToast(strMsg: "Login Successful");
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final AccessToken accessToken = loginResult.accessToken!;
    final OAuthCredential credential =
        FacebookAuthProvider.credential(accessToken.token);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  applelogin(String token) async {
    var data = {
      'token': token,
    };
    LoginApi registerresponse = LoginApi(data);
    final response = await registerresponse.appleocialmedialogin();
    if (response['status'] == 'success') {
      Map<String, dynamic> res = response['user'];
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      AppHelper.userid = res['id'].toString();
      AppHelper.email_VALUE = res['email'].toString();
      AppHelper.AUTH_TOKEN_VALUE = response['accessToken'].toString();
      sharedPreferences.setString(AppStringFile.userid, res['id'].toString());
      sharedPreferences.setString(AppStringFile.email, res['email'].toString());
      sharedPreferences.setString(
          AppStringFile.authtoken, response['accessToken'].toString());

      String? token;
      try {
        token = (await FirebaseMessaging.instance.getToken())!;
        print(token);
      } catch (e) {
        print(e);
      }
      var body = {"facId": token};
      LoginApi responsefcmtoken = LoginApi(body);
      final responsefcmtokenreturn = await responsefcmtoken.factokenregister();
      print(responsefcmtokenreturn);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.dashBoardScreenActivity, (route) => false);
      DialogHelper.showFlutterToast(strMsg: "Login Successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 5.h, bottom: 5.h, left: 5.w, right: 5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.loginscreen,
                    width: 40.w,
                    height: 40.w,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  Languages.of(context)!.letyou,
                  style: AppStyles.onboardtitle.copyWith(fontSize: 24.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SocialLoginscreenbuttonActivity(
                  logoimgname: AppImages.facebooklogo,
                  title: Languages.of(context)!.loginwithfb,
                  onTap: () async {
                    isLoading = true;
                    final credentials = await SignInWithApple.channel;
                    // print("credentials $credentials");
                    final credential =
                        await SignInWithApple.getAppleIDCredential(scopes: [
                      AppleIDAuthorizationScopes.email,
                      AppleIDAuthorizationScopes.fullName,
                    ], state: 'state');
                    log(credential.identityToken.toString());
                    applelogin(credential.identityToken.toString());
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                SocialLoginscreenbuttonActivity(
                  logoimgname: AppImages.googlelogo,
                  title: Languages.of(context)!.loginwithgoogle,
                  onTap: () {
                    isLoading = true;
                    signInWithGoogle();
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                SocialLoginscreenbuttonActivity(
                  logoimgname: AppImages.applelogo,
                  title: Languages.of(context)!.loginwithapple,
                  onTap: () async {
                    final userCredential = await signInWithFacebook();
                    if (userCredential != null) {
                      // here you will have your Firebase user in:
                      // userCredential.user
                      // log(await userCredential.user!.getIdToken());
                      final idToken = await userCredential.user!.getIdToken();
                      print("idToken $idToken");
                      print(await userCredential.user!);
                      facebooklogin(idToken.toString());
                    }
                  },
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Container(
                      height: .2.h,
                      width: 40.w,
                      color: AppColors.colorgrey,
                    ),
                    Spacer(),
                    Text(
                      Languages.of(context)!.orloginwith,
                      style: AppStyles.onboardsubtitle,
                    ),
                    Spacer(),
                    Container(
                      height: .2.h,
                      width: 40.w,
                      color: AppColors.colorgrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                ButtonWidget(
                  text: Languages.of(context)!.loginwithemail,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.loginScreen);
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      Languages.of(context)!.donthaveaccount,
                      style: AppStyles.onboardbody.copyWith(
                          color: AppColors.colorgrey, fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signupscreen);
                      },
                      child: Text(
                        Languages.of(context)!.signup,
                        style: AppStyles.onboardbody.copyWith(
                            color: AppColors.primarycolors, fontSize: 16.sp),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
