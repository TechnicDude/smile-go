import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class TreatmenttimerUiScreenActivity extends StatelessWidget {
  final String title;
  //final IconData? icon;
  final Function()? onTap;
  const TreatmenttimerUiScreenActivity(
      {super.key, required this.title, this.onTap}); //required this.icon,

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Row(children: [
          SizedBox(
            width: 4.w,
          ),
          doctordetails(Icons.forward_rounded, AppColors.colorgreydark),
          SizedBox(
            width: 2.w,
          ),
          doctordetails(
            Icons.stop,
            AppColors.primarycolors,
          ),
          Spacer(),
          Container(
            height: 5.h,
            width: 25.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3.w)),
              color: AppColors.colorgrey.withOpacity(0.5),
              border: Border.all(color: AppColors.colorgrey, width: 0.1),
            ),
            child: Center(
              child: Text(
                title,
                style: AppStyles.onboardbody
                    .copyWith(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget doctordetails(
    IconData? icon,
    color,
  ) {
    return Column(
      children: [
        Container(
          height: 5.h,
          width: 5.h,
          decoration: BoxDecoration(
              color: color.withOpacity(.3), shape: BoxShape.circle),
          child: Icon(
            icon,
            color: AppColors.primarycolors,
          ),
        ),
      ],
    );
  }
}
