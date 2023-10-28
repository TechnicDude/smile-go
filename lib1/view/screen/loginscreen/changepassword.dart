import 'package:flutter/material.dart';
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
import 'package:smile_and_go_app/utils/mainbar.dart';
import 'package:smile_and_go_app/utils/textfileds/textform.dart';

class ChangePasswordScreenActivity extends StatefulWidget {
  final String? id;
  final String? password;
  final String? userid;
  final String? pagetype;

  const ChangePasswordScreenActivity({
    super.key,
    this.id,
    this.password,
    this.pagetype,
    this.userid,
  });

  @override
  State<ChangePasswordScreenActivity> createState() =>
      _ChangePasswordScreenActivityState();
}

class _ChangePasswordScreenActivityState
    extends State<ChangePasswordScreenActivity> {
  String error = '';

  final _formKey = GlobalKey<FormState>();
  TextEditingController currentpasswordController = TextEditingController();
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
                MainBar(
                  //text: Languages.of(context)!.changepassword,
                  image: AppImages.forgotscreenill,
                ),
                TextFormScreen(
                  textEditingController: currentpasswordController,
                  hinttext: Languages.of(context)!.currentpassword,
                  // suffixIcon: true,
                  icon: Icons.password,
                  // obscure: _obscureText1,
                  // onPressed: _toggle1,

                  validator: AppValidator.currentpasswordValidator,
                ),
                SizedBox(
                  height: 2.h,
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

                    changePassword(
                        currentpasswordController.text,
                        newpasswordController.text,
                        confirmnewpasswordController.text);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  changePassword(String currentpassword, String newpassword,
      String confirmnewpassword) async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (_formKey.currentState!.validate()) {
        if (newpasswordController.text == confirmnewpasswordController.text) {
          if (currentpasswordController.text != newpasswordController.text) {
            var data = {
              //'id': widget.id,
              'currentPassword': currentpassword.toString().trim(),
              'newPassword': newpassword.toString().trim(),
              'confirmnewpassword': confirmnewpassword.toString().trim()

              // 'email': widget.email,
            };

            LoginApi registerresponse = LoginApi(data);
            var response = await registerresponse.changepassword();
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
                      response['message']); //"User New password Updated!!");
              // Navigator.pushReplacementNamed(context, Routes.loginScreen);

              Navigator.pop(context);
            } else {
              DialogHelper.showFlutterToast(
                  strMsg: "Current password is Incorrect");
            }
          } else {
            setState(() {
              error = "Current password and new password should not be same";
              isLoading = false;
            });
            DialogHelper.showFlutterToast(
                strMsg: "Current password and new password should not be same");
          }
        } else {
          setState(() {
            error = "New password and current password didn't match";
            isLoading = false;
          });

          DialogHelper.showFlutterToast(
              strMsg: "New password and current password didn't match");
        }
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });

      DialogHelper().shoppopDialog(context);
    }
  }
}
