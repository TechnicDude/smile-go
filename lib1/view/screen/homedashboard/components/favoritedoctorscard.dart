import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class FavoriteDoctorscardScreenActivity extends StatelessWidget {
  const FavoriteDoctorscardScreenActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorgreycard,
          borderRadius: BorderRadius.circular(2.w)),
      child: Padding(
        padding: EdgeInsets.only(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
        child: Row(
          children: [
            Container(
              height: 20.w,
              width: 20.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.onboardingsec))),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Dr. Deepika",
                        style: AppStyles.onboardtitle.copyWith(fontSize: 15.sp),
                      ),
                      Spacer(),
                      Icon(
                        Icons.favorite_border,
                        color: AppColors.primarycolors,
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: AppColors.secondrycolors,
                        size: 4.w,
                      ),
                      Text(
                        " Location",
                        style: AppStyles.onboardbody
                            .copyWith(color: AppColors.colorgreydark),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: AppColors.secondrycolors,
                        size: 4.w,
                      ),
                      Text(
                        " 4.5(35 reviews)",
                        style: AppStyles.onboardbody
                            .copyWith(color: AppColors.colorgreydark),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}