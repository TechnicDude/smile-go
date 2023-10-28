import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/PatientAppointmentList.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:timeago/timeago.dart' as timeago;

class CancelledCardUI extends StatelessWidget {
  Data patientAppointmentList;
  CancelledCardUI({super.key, required this.patientAppointmentList});

  @override
  Widget build(BuildContext context) {
  
  
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorgreycard),
      child: Padding(
        padding: EdgeInsets.only(top: 1.h, bottom: 1.h, left: 2.w, right: 2.w),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 20.w,
                  width: 20.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.onboardingsec),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            patientAppointmentList.doctorDetail!.firstName
                                    .toString() +
                                " " +
                                patientAppointmentList.doctorDetail!.lastName
                                    .toString(),
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 15.sp),
                          ),
                          Spacer(),
                          Text(
                            patientAppointmentList != null
                                ? patientAppointmentList.bookingId.toString()
                                : " ",
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Date : ",
                            style: AppStyles.onboardsubtitle.copyWith(
                                fontSize: 15.sp, fontWeight: FontWeight.w600),
                          ),

                          Text(
                            DateFormat.yMMMMd(
                                        Languages.of(context)!.LanguageType)
                                    .format(DateFormat("yyyy-MM-dd").parse(
                                        patientAppointmentList.bookingDate
                                            .toString())) +
                                " | " +
                                DateFormat.jm().format(DateFormat("hh:mm")
                                    .parse(patientAppointmentList.bookingTime
                                        .toString())),
                            style: AppStyles.onboardsubtitle
                                .copyWith(fontSize: 15.sp),
                          ),

                          // Spacer(),
                          // Icon(
                          //   Icons.chat_rounded,
                          //   color: AppColors.primarycolors,
                          // ),
                          // SizedBox(
                          //     height: 3.5.h, child: Image.asset(AppImages.chat))
                        ],
                      ),
                      Text(
                        patientAppointmentList.cancelReason != null
                            ? patientAppointmentList.cancelReason.toString()
                            : '',
                        style:
                            AppStyles.onboardsubtitle.copyWith(fontSize: 15.sp),
                      ),
                    ],
                  ),
                )
              ],
            ),
            // Divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SizedBox(
            //       width: 40.w,
            //       child: ButtonWidgetCou(
            //         heightbuttom: 3.h,
            //         buttoncolor: Colors.transparent,
            //         buttontextcolor: AppColors.secondrycolors,
            //         boardcolor: AppColors.secondrycolors,
            //         text: Languages.of(context)!.bookagain,
            //         onTap: () {
            //           // Navigator.pushNamed(context, Routes.dashBoardScreenActivity);
            //         },
            //       ),
            //     ),
            //     SizedBox(
            //       width: 40.w,
            //       child: ButtonWidgetCou(
            //         heightbuttom: 3.h,
            //         text: Languages.of(context)!.leaveareview,
            //         onTap: () {
            //           // Navigator.pushNamed(context, Routes.dashBoardScreenActivity);
            //         },
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
 
 
 
  }
}
