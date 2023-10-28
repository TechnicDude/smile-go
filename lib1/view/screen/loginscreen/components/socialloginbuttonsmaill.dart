import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class SocialLoginscreenbuttonSmallActivity extends StatelessWidget {
  final String? logoimgname;
  final String? title;
  final Function()? onTap;
  const SocialLoginscreenbuttonSmallActivity({
    super.key,
    this.logoimgname,
    this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.w),
            border: Border.all(color: AppColors.colorgrey)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            logoimgname!,
            height: 7.w,
            width: 7.w,
          ),
        ),
      ),
    );
  }
}
