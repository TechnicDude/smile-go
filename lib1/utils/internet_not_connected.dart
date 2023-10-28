import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class InternetNotAvailable extends StatelessWidget {
  double? height;

  InternetNotAvailable({Key? key, double? height});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 55.h,
        width: 50.w,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.nointernet,
                  color: AppColors.colorgrey.withOpacity(0.3)),
              Text(
                'Ingen internetanslutning!',
                style: AppStyles.onboardtitle.copyWith(
                    color: AppColors.colorgrey.withOpacity(0.5),
                    fontSize: 16.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
