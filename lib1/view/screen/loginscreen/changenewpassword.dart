import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/loginapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_validator.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/textfileds/textform.dart';

class ChangenewPasswordScreenActivity extends StatefulWidget {
  final Function callback;
  final String? id;
  final String? password;
  final String? userid;
  final String? pagetype;
  final String? otp;
  final String? email;
  const ChangenewPasswordScreenActivity(
      {super.key,
      required this.callback,
      this.id,
      this.password,
      this.pagetype,
      this.email,
      this.userid,
      this.otp});

  @override
  State<ChangenewPasswordScreenActivity> createState() =>
      _ChangenewPasswordScreenActivityState();
}

class _ChangenewPasswordScreenActivityState
    extends State<ChangenewPasswordScreenActivity> {
  String error = '';

  final _formKey = GlobalKey<FormState>();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmnewpasswordController = TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;

  bool isLoading = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.secondrycolors),
        backgroundColor: AppColors.colorswhite,
        title: Text(
          Languages.of(context)!.changepassword,
          style:
              AppStyles.onboardsubtitle.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(top: 4.h, bottom: 4.h, left: 5.w, right: 5.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: Image.asset(
                    AppImages.forgotscreenill,
                    width: 50.w,
                    height: 20.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextFormScreen(
                  hinttext: Languages.of(context)!.newpassword,
                  icon: Icons.lock,
                  textEditingController: newpasswordController,
                  validator: AppValidator.passwordValidator,
                  suffixIcon: true,
                  obscure: _obscureText,
                  onPressed: _toggle,
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFormScreen(
                  hinttext: Languages.of(context)!.confirmnewpassword,
                  icon: Icons.lock,
                  textEditingController: confirmnewpasswordController,
                  validator: AppValidator.passwordValidator,
                  suffixIcon: true,
                  obscure: _obscureText1,
                  onPressed: _toggle1,
                ),
                SizedBox(
                  height: 5.h,
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
                  text: Languages.of(context)!.continues,
                  onTap: () {
                    setState(() {
                      error = '';
                    });
                    if (isLoading) {
                      return;
                    }

                    resetPassword(newpasswordController.text,
                        confirmnewpasswordController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  resetPassword(String newpassword, String confirmpassword) async {
    setState(() {
      isLoading = true;
      widget.callback(true);
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          var data = {
            'otp': widget.otp.toString().trim(),
            'newPassword': newpassword.toString().trim(),
            'email': widget.email.toString().trim(),
          };
          LoginApi registerresponse = LoginApi(data);
          var response = await registerresponse.forgetpassword();
          print(response);
          setState(() {
            isLoading = false;
          });
          if (response['status'].toString() == 'success') {
            setState(() {
              isLoading = false;
            });

            DialogHelper.showFlutterToast(
                strMsg:
                    Languages.of(context)!.confirmpasswordandpasswordnotmatch);
            Navigator.pushReplacementNamed(context, Routes.loginScreenActivity);
          } else {
            DialogHelper.showFlutterToast(strMsg: response['error'].toString());
            setState(() {
              error = response['error'].toString();
              widget.callback(false);
              isLoading = false;
            });
          }
        } else {
          setState(() {
            error = Languages.of(context)!.confirmpasswordmustbematch;
            isLoading = false;
          });

          DialogHelper.showFlutterToast(
              strMsg: Languages.of(context)!.confirmpasswordmustbematch);
        }
      } else {
        setState(() {
          isLoading = false;
          widget.callback(false);
        });
      }
    } else {
      AppHelper().dialogBuilder(
          context, "", Languages.of(context)!.internetnotavailable);
      setState(() {
        isLoading = false;
        widget.callback(false);
      });
    }
  }
}
