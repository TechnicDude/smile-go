import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/treatmentPhotos.dart';

class TreatmentDaysUiScreenActivity extends StatelessWidget {
  final String title;
  //final IconData? icon;
  final String subtitle;
  final String title2;

  final Function()? onTap;
  const TreatmentDaysUiScreenActivity(
      {super.key,
      required this.title,
      required this.title2,
      required this.subtitle,
      required this.onTap}); //required this.icon,

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.onboardtitle
                  .copyWith(color: AppColors.primarycolors, fontSize: 16.sp),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: 18.h,
          decoration: BoxDecoration(
            color: AppColors.colortextgrey,
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.task_alt,
                        color: AppColors.primarycolors,
                        size: 3.h,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(2.w)),
                        ),
                        child: SizedBox(
                          width: 75.w,
                          child: Text(
                            subtitle,
                            style: AppStyles.onboardsubtitle.copyWith(
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title2,
              style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        TreatmentPhotosScreenUI(
          onTap: () {},
        ),
      ],
    );
  }
}
