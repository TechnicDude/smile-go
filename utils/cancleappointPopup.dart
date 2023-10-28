import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';
import 'package:smile_and_go_app/utils/cancleappointsuccessPopup.dart';

class CancleappointPopup extends StatefulWidget {
  final Function? callback;
  String bookingId;
  CancleappointPopup({super.key, this.callback, required this.bookingId});

  @override
  State<CancleappointPopup> createState() => _CancleappointPopupState();
}

class _CancleappointPopupState extends State<CancleappointPopup> {
  @override
  Widget build(BuildContext context) {
    print("bookingIdfdf" + widget.bookingId);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40.h,
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(1.h)),
            border: Border.all(color: AppColors.colorswhite, width: 0.2),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(1, 2),
              ),
            ],
            gradient: LinearGradient(
                colors: [AppColors.colorswhite, AppColors.colorswhite],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                textAlign: TextAlign.center,
                Languages.of(context)!.cancelaoppintment,
                style: AppStyles.onboardtitle
                    .copyWith(fontSize: 18.sp, color: Colors.red),
              ),
              SizedBox(
                height: 1.h,
              ),
              Divider(),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: 70.w,
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    Languages.of(context)!.areyoursurecancleapprointment,
                    style: AppStyles.onboardsubtitle.copyWith(fontSize: 15.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: ButtonWidgetCou(
                      heightbuttom: 4.h,
                      buttoncolor: AppColors.colorgreyButton,
                      buttontextcolor: AppColors.blackColor,
                      boardcolor: AppColors.colorgreyButton,
                      fontsize: 14.sp,
                      text: Languages.of(context)!.back,
                      onTap: () {
                        widget.callback!("ok");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 60.w,
                    child: ButtonWidgetCou(
                      heightbuttom: 4.h,
                      fontsize: 14.sp,
                      text: Languages.of(context)!.yescancel,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.cancelAppointment,
                            arguments: {
                              AppStringFile.bookingId: widget.bookingId
                            });
                        widget.callback!("ok");
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
