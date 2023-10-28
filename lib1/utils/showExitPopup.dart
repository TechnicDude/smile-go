import 'dart:io';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

Future<bool> showExitPopup(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Languages.of(context)!.wanttoexitapp,
                  style: AppStyles.onboardbody.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          Languages.of(context)!.yes,
                          style: AppStyles.onboardbody.copyWith(
                              fontSize: 16.sp, color: AppColors.colorswhite),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: AppColors.primarycolors),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(Languages.of(context)!.no,
                          style: AppStyles.onboardbody.copyWith(
                              fontSize: 16.sp, color: AppColors.colorswhite)),
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.secondrycolors,
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
