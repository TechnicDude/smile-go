import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class ChattinglistCardUIScreenActivity extends StatelessWidget {
  const ChattinglistCardUIScreenActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      decoration: BoxDecoration(
        color: AppColors.colorgreycard,
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AppImages.onboardingsec)),
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      "Dr Lorem Ipsum",
                      maxLines: 1,
                      style: AppStyles.onboardtitle.copyWith(fontSize: 15.sp),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  SizedBox(
                    width: 50.w,
                    child: Text(
                      "You have appointment with lorem ipsum at 16:00 pm today met now.",
                      maxLines: 2,
                      style: AppStyles.onboardbody.copyWith(fontSize: 13.sp),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                  child: Text(
                    "16:05 pm",
                    maxLines: 1,
                    style: AppStyles.onboardtitle.copyWith(fontSize: 14.sp),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 4.w,
                  width: 4.w,
                  decoration: BoxDecoration(
                      boxShadow: [],
                      color: AppColors.primarycolors,
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "5",
                      style: AppStyles.onboardsubtitle.copyWith(
                          color: AppColors.colorswhite, fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
