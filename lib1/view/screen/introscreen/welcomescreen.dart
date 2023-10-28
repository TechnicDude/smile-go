import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget.dart';

class WelcomeScreenActivity extends StatefulWidget {
  const WelcomeScreenActivity({super.key});

  @override
  State<WelcomeScreenActivity> createState() => _WelcomeScreenActivityState();
}

class _WelcomeScreenActivityState extends State<WelcomeScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: AppColors.secondrycolors,

            // gradient: LinearGradient(
            //   begin: Alignment.topLeft,
            //   end: Alignment.bottomRight,
            //   stops: [0.2, 0.2, 0.5, 0.5],
            //   colors: [
            //     AppColors.primarycolors,
            //     AppColors.primarycolors,
            //     AppColors.secondrycolors,
            //     AppColors.secondrycolors,
            //   ],
            // ),

            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage(
                AppImages.welcomescreenbackground,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.smileandgowhitelogo,
              width: 30.w,
              height: 20.w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              Languages.of(context)!.labelWelcome,
              textAlign: TextAlign.center,
              style: AppStyles.onboardtitle.copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10, left: 30, right: 30),
              child: Text(
                Languages.of(context)!.welcomemessage,
                textAlign: TextAlign.center,
                style: AppStyles.onboardbody.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: ButtonWidget(
                text: Languages.of(context)!.continues,
                onTap: () {
                  Navigator.pushNamed(context, Routes.onboardingScreen);
                },
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        )
      ],
    ));
  }
}
