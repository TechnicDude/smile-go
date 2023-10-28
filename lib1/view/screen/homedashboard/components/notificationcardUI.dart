import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/model/NotificationModel.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class NotificationCardUIScreenActivity extends StatelessWidget {
  final Datum getnotificationLisData;
  const NotificationCardUIScreenActivity(this.getnotificationLisData,
      {super.key});

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
              width: 2.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getnotificationLisData.title.toString() +
                        "" +
                        getnotificationLisData.subTitle.toString(),
                    style: AppStyles.onboardbody,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Just now",
                    style: AppStyles.onboardtitle.copyWith(fontSize: 13.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
