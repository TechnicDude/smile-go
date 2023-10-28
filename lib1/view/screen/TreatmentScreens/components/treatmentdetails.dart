import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/wheelmeasurment.dart';

class BodysDetailsScreenACtivity extends StatelessWidget {
  final String title;
  final double value;
  final String time;

  const BodysDetailsScreenACtivity({
    super.key,
    required this.title,
    required this.value,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 25.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3.w)),
        border: Border.all(color: AppColors.colorswhite, width: 0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(1, 2),
          ),
        ],
        gradient: LinearGradient(
            colors: [AppColors.colorswhite, AppColors.colorswhite],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 2.h, left: 2.w, right: 2.w, bottom: 2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 17.w,
                  child: Text(title,
                      maxLines: 2,
                      style:
                          AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp)),
                ),
                Divider(),
                Text(time,
                    style: AppStyles.onboardsubtitle.copyWith(fontSize: 12.sp)),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WeekLyDetailsmeasurmentScreenActivity(
                  title: "3 hours",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
