import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class SignupScreenActivity extends StatefulWidget {
  const SignupScreenActivity({super.key});

  @override
  State<SignupScreenActivity> createState() => _SignupScreenActivityState();
}

class _SignupScreenActivityState extends State<SignupScreenActivity> {
  bool isLoading = false;
  bool _obscureText = true;
  bool setvalue = false;
  String error = '';
  bool valuedata = false;
  final _formKey = GlobalKey<FormState>();

  String? selectedValue = "";
  final _dropdownFormKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(Languages.of(context)!.rolemessage), value: ""),
      DropdownMenuItem(
          child: Text(Languages.of(context)!.patients), value: "3"),
      DropdownMenuItem(child: Text(Languages.of(context)!.doctor), value: "2"),
    ];
    return menuItems;
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

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
                  text: Languages.of(context)!.createnewaccount,
                  image: AppImages.applogo,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormScreen(
                        hinttext: Languages.of(context)!.name,
                        icon: Icons.person_outline_outlined,
                        textEditingController: firstnameController,
                        validator: AppValidator.nameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      TextFormScreen(
                        hinttext: Languages.of(context)!.lastname,
                        icon: Icons.person_outline_outlined,
                        textEditingController: lastnameController,
                        validator: AppValidator.lastnameValidator,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
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
                        hinttext: Languages.of(context)!.mobile,
                        icon: Icons.mobile_friendly,
                        textEditingController: mobileController,
                        validator: AppValidator.mobileValidator,
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
                      SizedBox(
                        height: 2.h,
                      ),

                      // dropdown for select role
                      // DropdownButtonFormField(
                      //     decoration: InputDecoration(
                      //       filled: true,
                      //       enabledBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(
                      //             color: Colors.white,
                      //           ),
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(10.w),
                      //           )),
                      //       // fillColor: ,
                      //     ),
                      //     validator: (value) =>
                      //         value == null ? "Select a country" : null,
                      //     // dropdownColor: Colors.blueAccent,
                      //     value: selectedValue,
                      //     onChanged: (String? newValue) {
                      //       setState(() {
                      //         selectedValue = newValue!;
                      //         print(selectedValue);
                      //       });
                      //     },
                      //     items: dropdownItems),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: valuedata,
                      onChanged: (value) {
                        setState(() {
                          valuedata = value!;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Text(
                          Languages.of(context)!.iacceptthe,
                          style: AppStyles.onboardbody,
                        ),
                        Text(
                          Languages.of(context)!.termsandcondition,
                          style: AppStyles.onboardbody
                              .copyWith(color: Colors.blue),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Text(
                    error,
                    style: AppStyles.onboardsubtitle
                        .copyWith(fontSize: 15.sp, color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                ButtonWidget(
                  text: Languages.of(context)!.signup,
                  onTap: () {
                    if (isLoading) {
                      return;
                    }
                    signup(
                      firstnameController.text,
                      lastnameController.text,
                      emailController.text,
                      mobileController.text,
                      passwordController.text,
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                RichText(
                  text: TextSpan(
                    text: Languages.of(context)!.alreadyregister,
                    style: AppStyles.onboardbody.copyWith(),
                    children: <TextSpan>[
                      TextSpan(
                        text: Languages.of(context)!.login,
                        style: AppStyles.onboardbody.copyWith(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              Navigator.pushNamed(context, Routes.loginScreen),
                      ),
                    ],
                  ),
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

  signup(firatname, lastname, email, password, mobile) async {
    setState(() {
      isLoading = true;
    });

    final bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      if (valuedata == true) {
        if (_formKey.currentState!.validate()) {
          // if (selectedValue != "") {
          var data = {
            'firstName': firatname.toString().trim(),
            'lastName': lastname.toString().trim(),
            'emailAddress': email.toString().trim(),
            'userPassword': password.toString().trim(),
            'phoneNumber': mobile.toString().trim(),
            // "userRole": selectedValue,
          };
          LoginApi registerresponse = LoginApi(data);
          var response = await registerresponse.register();

          if (response['status'].toString().toLowerCase() == "success") {
            //Languages.of(context)!.otpsend);
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            AppHelper.role = selectedValue.toString();
            sharedPreferences.setString(
                AppStringFile.role, selectedValue.toString());
            Map<String, dynamic> user = response['data'];
            Navigator.pushNamed(context, Routes.otpVerify, arguments: {
              AppStringFile.pagetype: AppStringFile.signup,
              AppStringFile.email: email,
            });
            setState(() {
              isLoading = false;
            });
            DialogHelper.showFlutterToast(
                strMsg:
                    "otp send successfully"); // response['error'].toString());
            // otp send
          } else {
            DialogHelper.showFlutterToast(strMsg: response['error'].toString());
            setState(() {
              error = response['error'].toString() == "null"
                  ? "something went wrong"
                  : response['error'].toString();
              isLoading = false;

              // error = response['error'].toString();
              // isLoading = false;
            });
          }
          // } else {
          //   AppHelper().dialogBuilder(context, Languages.of(context)!.alter,
          //       Languages.of(context)!.rolemessage);
          //   setState(() {
          //     //  widget.callback!(false);
          //     isLoading = false;
          //   });
          // }

          // DialogHelper.showFlutterToast(strMsg: "Registration Successful");
        } else {
          setState(() {
            isLoading = false;
          });
        }
      } else {
        AppHelper().dialogBuilder(context, Languages.of(context)!.alert,
            Languages.of(context)!.pleaseaccettermesandcondtions);
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
