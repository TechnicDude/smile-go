import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/loginapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/app_validator.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/mainbar.dart';
import 'package:smile_and_go_app/utils/textfileds/textform.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

String error = '';

bool isLoading = false;
TextEditingController emailController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.secondrycolors),
        backgroundColor: AppColors.colorswhite,
        title: Text(
          Languages.of(context)!.forgotpasswords,
          style:
              AppStyles.onboardsubtitle.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 4.h, bottom: 4.h, left: 5.w, right: 5.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    MainBar(
                      //  text: Languages.of(context)!.forgotpassword,
                      image: AppImages.forgotscreenill,
                    ),

                    TextFormScreen(
                      hinttext:
                          Languages.of(context)!.forgotpasswordemailandmobile,
                      icon: Icons.mail,
                      textEditingController: emailController,
                      validator: AppValidator.emailValidator,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      Languages.of(context)!.forgotpasswordmsg,
                      style: AppStyles.onboardbody,
                    ),
                    // Spacer(),
                    SizedBox(
                      height: 8.h,
                    ),

                    Center(
                      child: Text(
                        error,
                        style: AppStyles.onboardsubtitle
                            .copyWith(color: Colors.red, fontSize: 15.sp),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),

                    ButtonWidget(
                      text: Languages.of(context)!.continues,
                      onTap: () {
                        setState(() {
                          error = '';
                        });
                        if (isLoading) {
                          return;
                        }

                        forgotPassword(emailController.text);
                      },
                    ),

                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Languages.of(context)!.remeberyourpassword,
                          style: AppStyles.onboardbody.copyWith(
                              color: AppColors.colorgrey, fontSize: 16.sp),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.loginScreen);
                          },
                          child: Text(
                            Languages.of(context)!.login,
                            style: AppStyles.onboardbody.copyWith(
                                color: AppColors.primarycolors,
                                fontSize: 16.sp),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
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

  forgotPassword(String email) async {
    setState(() {
      isLoading = true;
      // widget.callback(true);
    });
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        var data = {
          "email": emailController.text.toString().trim(),
        };
        print(data);
        LoginApi loginApi = LoginApi(data);
        final response = await loginApi.sentotp();

        if (response['status'].toString().toLowerCase() == "success") {
          // AppHelper().dialogBuilderforget(context, "Check Your Email",
          //     "Please check the email address $email for instructions to reset your password.");
          setState(() {
            isLoading = false;
            //  widget.callback(false);
          });

          Navigator.pushNamed(context, Routes.otpVerify, arguments: {
            AppStringFile.email: email,
            AppStringFile.pagetype: AppStringFile.forgot_password,
            //  StringFile.id: response['user']['id'],
          });
        } else {
          DialogHelper.showFlutterToast(strMsg: response['error'].toString());
          setState(() {
            error = response['error'].toString();
            //widget.callback(false);
            isLoading = false;
          });
        }
      } else {
        setState(() {
          isLoading = false;
          //   widget.callback(false);
        });
      }
    } else {
      AppHelper().dialogBuilder(
          context, "", Languages.of(context)!.internetnotavailable);
      setState(() {
        isLoading = false;
        //widget.callback(false);
      });
    }
  }
}
