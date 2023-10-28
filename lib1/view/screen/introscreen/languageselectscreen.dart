import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/localization/locale_constants.dart';
import 'package:smile_and_go_app/model/language_model.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget.dart';

class LanguageSelectScreenActivity extends StatefulWidget {
  const LanguageSelectScreenActivity({super.key});

  @override
  State<LanguageSelectScreenActivity> createState() =>
      _LanguageSelectScreenActivityState();
}

class _LanguageSelectScreenActivityState
    extends State<LanguageSelectScreenActivity> {
  String dropdownvalue = 'English';
  var items = [
    'English',
    'French',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Languages.of(context)!.labelSelectLanguage,
            style: AppStyles.onboardtitle,
          ),
          Text(
            Languages.of(context)!.labelChangeLanguage,
            style: AppStyles.onboardtitle,
          ),
          SizedBox(
            height: 7.h,
          ),
          Center(
            child: Image.asset(
              AppImages.languageillimg,
              width: 90.w,
              height: 30.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: AppColors.splashloaderonecolor,
                    style: BorderStyle.solid,
                    width: 0.80),
              ),
              child: DropdownButton(
                value: dropdownvalue,
                underline: SizedBox(),
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) async {
                  setState(() {
                    dropdownvalue = newValue!;
                  });

                  if (dropdownvalue == "English") {
                    changeLanguage(
                        context, LanguageModel.languageList()[0].languageCode);
                    SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    // String languageCode =
                    //     _prefs.getString(prefSelectedLanguageCode) ?? "en";
                    setState(() {
                      AppHelper.language =
                          LanguageModel.languageList()[0].languageCode;
                    });

                    await _prefs.setString(prefSelectedLanguageCode,
                        LanguageModel.languageList()[0].languageCode);
                  } else {
                    changeLanguage(
                        context, LanguageModel.languageList()[1].languageCode);
                    SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    // String languageCode =
                    //     _prefs.getString(prefSelectedLanguageCode) ?? "en";
                    setState(() {
                      AppHelper.language =
                          LanguageModel.languageList()[1].languageCode;
                    });

                    await _prefs.setString(prefSelectedLanguageCode,
                        LanguageModel.languageList()[1].languageCode);
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: ButtonWidget(
              text: Languages.of(context)!.submit,
              onTap: () {
                Navigator.pushNamed(context, Routes.welcomeScreen);
                // setState(() {
                //   _error = '';
                // });
                // if (isLoading) {
                //   return;
                // }

                // login(emailController.text, passwordController.text);
              },
            ),
          )
        ],
      )),
    );
  }
}
