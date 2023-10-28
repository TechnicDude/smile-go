import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class SocialLoginscreenbuttonActivity extends StatelessWidget {
  final String? logoimgname;
  final String? title;
  final Function()? onTap;
  const SocialLoginscreenbuttonActivity({
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                logoimgname!,
                height: 7.w,
                width: 7.w,
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                title!,
                style: AppStyles.onboardbody,
              )
            ],
          ),
        ),
      ),
    );
  }
}
