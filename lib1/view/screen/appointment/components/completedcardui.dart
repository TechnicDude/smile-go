import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/PatientAppointmentList.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';

class CompletedCardUI extends StatelessWidget {
  Data patientAppointmentList;
  CompletedCardUI({super.key, required this.patientAppointmentList});

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
                          Spacer(),
                          Icon(
                            Icons.chat_rounded,
                            color: AppColors.primarycolors,
                          ),
                        ],
                      ),
                      Text(
                        "Message :",
                        style:
                            AppStyles.onboardsubtitle.copyWith(fontSize: 15.sp),
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40.w,
                  child: ButtonWidgetCou(
                    heightbuttom: 4.h,
                    buttoncolor: Colors.transparent,
                    buttontextcolor: AppColors.secondrycolors,
                    boardcolor: AppColors.secondrycolors,
                    fontsize: 14.sp,
                    text: Languages.of(context)!.bookagain,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        Routes.doctordetails,
                        arguments: {
                          AppStringFile.doctordetails: patientAppointmentList,
                          AppStringFile.doctorName:
                              patientAppointmentList.doctorDetail!.firstName
                        },
                      );

                      // Navigator.pushNamed(context, Routes.dashBoardScreenActivity);
                    },
                  ),
                ),
                SizedBox(
                  width: 40.w,
                  child: ButtonWidgetCou(
                    heightbuttom: 4.h,
                    fontsize: 14.sp,
                    text: Languages.of(context)!.leaveareview,
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.dashBoardScreenActivity);
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
