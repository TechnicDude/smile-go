import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:smile_and_go_app/api/loginapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/app_validator.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/mainbar.dart';
import 'package:smile_and_go_app/utils/textfileds/textform.dart';
import 'package:smile_and_go_app/view/screen/loginscreen/components/socialloginbuttonsmaill.dart';

class LoginScreenActivity extends StatefulWidget {
  const LoginScreenActivity({super.key});

  @override
  State<LoginScreenActivity> createState() => _LoginScreenActivityState();
}

class _LoginScreenActivityState extends State<LoginScreenActivity> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isLoading = false;
  bool valuedata = false;

  final _formKey = GlobalKey<FormState>();
  String error = '';

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
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.secondrycolors),
        backgroundColor: AppColors.colorswhite,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              children: [
                MainBar(
                  text: Languages.of(context)!.logintoyouraccount,
                  image: AppImages.applogo,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormScreen(
                        hinttext: Languages.of(context)!.email,
                        icon: Icons.email_outlined,
                        textEditingController: emailController,
                        validator: AppValidator.emailValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.password,
                        icon: Icons.lock,
                        textEditingController: passwordController,
                        validator: AppValidator.passwordValidator,
                        suffixIcon: true,
                        obscure: _obscureText,
                        onPressed: _toggle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgetPassword);
                      },
                      child: Text(
                        Languages.of(context)!.forgotpassword,
                        style: AppStyles.onboardbody
                            .copyWith(color: AppColors.secondrycolors),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Center(
                  child: Text(
                    error,
                    style: AppStyles.onboardsubtitle
                        .copyWith(color: Colors.red, fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                ButtonWidget(
                  text: Languages.of(context)!.login,
                  onTap: () {
                    if (isLoading) {
                      return;
                    }

                    login(emailController.text, passwordController.text);
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
                Row(
                  children: [
                    Container(
                      height: .2.h,
                      width: 30.w,
                      color: AppColors.colorgrey,
                    ),
                    Spacer(),
                    Text(
                      Languages.of(context)!.orcontinuewith,
                      style: AppStyles.onboardbody,
                    ),
                    Spacer(),
                    Container(
                      height: .2.h,
                      width: 30.w,
                      color: AppColors.colorgrey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialLoginscreenbuttonSmallActivity(
                      logoimgname: AppImages.googlelogo,
                      onTap: () {
                        isLoading = true;
                        signInWithGoogle();
                      },
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    // if (Platform.isIOS)
                    SocialLoginscreenbuttonSmallActivity(
                      logoimgname: AppImages.facebooklogo,
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
                      width: 10.w,
                    ),
                    SocialLoginscreenbuttonSmallActivity(
                      logoimgname: AppImages.applelogo,
                      onTap: () async {
                        final userCredential = await signInWithFacebook();
                        if (userCredential != null) {
                          // here you will have your Firebase user in:
                          // userCredential.user

                          //  log(await userCredential.user!.getIdToken());
                          final idToken =
                              await userCredential.user!.getIdToken();
                          print("idToken $idToken");
                          print(await userCredential.user!);
                          facebooklogin(idToken.toString());
                        }
                      },
                    ),
                  ],
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
                ),
                SizedBox(
                  height: 4.h,
                ),
              ],
            ),
          )),
          if (isLoading)
            Container(
              height: 100.h,
              width: 100.w,
              color: Colors.transparent,
              child: Center(child: LoaderScreennew()),
            )
        ],
      ),
    );
  }

  login(email, password) async {
    setState(() {
      isLoading = true;
      // widget.callback(true);
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        // if (valuedata) {
        // setState(() {
        //   isLoading = false;
        //   // widget.callback(false);
        // });

        var data = {
          "email": emailController.text.toString().trim(),
          "password": passwordController.text.toString().trim(),
        };
        LoginApi loginApi = LoginApi(data);
        final response = await loginApi.login();

        log(response.toString());

        if (response['status'].toString().toLowerCase() == "success") {
          //  Map<String, dynamic> res = response['user'];

          AppHelper.AUTH_TOKEN_VALUE = response['accessToken'];
          AppHelper.email_VALUE = response['user']['emailAddress'];
          AppHelper.userid = response['user']['id'].toString();
          AppHelper.firstName = response['user']['firstName'].toString();
          AppHelper.lastName = response['user']['lastName'].toString();
          AppHelper.userAvatar = response['user']['userAvatar'].toString();
          AppHelper.role = response['user']['userRole'];

          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString(
              AppStringFile.userid, response['user']['id'].toString());

          sharedPreferences.setString(
              AppStringFile.email, response['user']['emailAddress'].toString());

          sharedPreferences.setString(
              AppStringFile.name, response['user']['firstName'].toString());

          sharedPreferences.setString(
              AppStringFile.lastname, response['user']['lastName'].toString());

          sharedPreferences.setString(AppStringFile.userAvatar,
              response['user']['userAvatar'].toString());

          sharedPreferences.setString(
              AppStringFile.authtoken, response['accessToken'].toString());

          sharedPreferences.setString(
              AppStringFile.role, response['user']['userRole']);

          DialogHelper.showFlutterToast(
              strMsg: Languages.of(context)!.loginsussces);

          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.dashBoardScreenActivity,
            (Route<dynamic> route) => false,
            arguments: {AppStringFile.email: emailController.text},
          );
          setState(() {
            // widget.callback(false);
            isLoading = false;
          });
        } else {
          DialogHelper.showFlutterToast(strMsg: response['error'].toString());
          setState(() {
            error = response['error'].toString();
            // widget.callback(false);
            isLoading = false;
          });
        }
        // }
        // else {
        //   AppHelper().dialogBuilder(context, Languages.of(context)!.alert,
        //       Languages.of(context)!.pleaseaccettermesandcondtions);
        //   setState(() {
        //     //  widget.callback(false);
        //     isLoading = false;
        //   });
        // }
      } else {
        setState(() {
          isLoading = false;
          // widget.callback(false);
        });
      }
    } else {
      setState(() {
        // widget.callback(false);
        isLoading = false;
      });

      AppHelper().dialogBuilder(
          context, "", Languages.of(context)!.internetnotavailable);
      setState(() {
        isLoading = false;
        //widget.callback(false);
      });
    }
  }
}
