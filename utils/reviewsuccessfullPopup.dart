import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';

class ReviewsuccessfullPopup extends StatelessWidget {
  final Function? callback;
  const ReviewsuccessfullPopup({super.key, this.callback});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            height: 45.h,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  height: 25.w,
                  width: 25.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.rateus),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          Languages.of(context)!.reviewsuccessfull,
                          textAlign: TextAlign.center,
                          style:
                              AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 60.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            Languages.of(context)!.reviewsuccessfullmsg,
                            maxLines: 3,
                            style: AppStyles.onboardsubtitle
                                .copyWith(fontSize: 15.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                        width: 60.w,
                        child: ButtonWidgetCou(
                          heightbuttom: 4.h,
                          boardcolor: AppColors.colorgreyButton,
                          fontsize: 14.sp,
                          text: Languages.of(context)!.okay,
                          onTap: () {
                            callback!("ok");
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
