import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class DoctorSpecialityUICard extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? color1;
  final Function()? onTap;
  const DoctorSpecialityUICard({
    super.key,
    this.title,
    this.icon,
    this.color1,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 5.h,
          decoration: BoxDecoration(
              color: AppColors.primarycolors.withOpacity(.3),
              shape: BoxShape.circle),
          child: Icon(
            icon,
            size: 3.h,
            color: AppColors.primarycolors,
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        SizedBox(
          width: 13.w,
          child: Text(
            title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.onboardtitle.copyWith(
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
