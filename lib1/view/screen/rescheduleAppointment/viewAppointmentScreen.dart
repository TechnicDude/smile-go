import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';

class ViewAppointmentScreen extends StatefulWidget {
  final TopdoctorslistData doctordetails;
  final bookingResponse;
  const ViewAppointmentScreen(
      {super.key, required this.doctordetails, this.bookingResponse});

  @override
  State<ViewAppointmentScreen> createState() => _ViewAppointmentScreenState();
}

class _ViewAppointmentScreenState extends State<ViewAppointmentScreen> {
  bool showpoppScheduleSuccess = false;
  @override
  Widget build(BuildContext context) {
    print("kfjlglkjkggglfkg" + widget.doctordetails.companyName.toString());
    return Scaffold(
        floatingActionButton: ButtonWidgetCou(
            heightbuttom: 5.h,
            boardcolor: AppColors.colorgreyButton,
            fontsize: 14.sp,
            text: Languages.of(context)!.sendmessage,
            onTap: () {
              // Navigator.pushNamed(context, Routes.chattinglistScreenActivity);
            }),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: Languages.of(context)!.myappointment,
            icon2: Icons.pending_outlined,
            color2: AppColors.primarycolors,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 1.h, bottom: 4.h, left: 4.w, right: 4.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
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
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dr. Deepika",
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 15.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            width: 60.w,
                            child: Text(
                              "Immunologists",
                              maxLines: 1,
                              style: AppStyles.onboardsubtitle
                                  .copyWith(fontSize: 14.sp),
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          SizedBox(
                            width: 60.w,
                            child: Text(
                              "The Valley Hospital in california US.",
                              maxLines: 1,
                              style: AppStyles.onboardsubtitle
                                  .copyWith(fontSize: 14.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.scheduleappointment,
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 17.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Today, December 22. 2022",
                        style:
                            AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "16.00 - 16.30 PM (30 minutes)",
                        style:
                            AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.patientinformation,
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 17.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Full Name : ${AppHelper.firstName} ${AppHelper.lastName}",
                        style:
                            AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Gender : ${AppHelper.firstName}",
                        style:
                            AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Age : 27",
                        style:
                            AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        child: Text(
                          "Problem: Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                          maxLines: 3,
                          style: AppStyles.onboardsubtitle
                              .copyWith(fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            Languages.of(context)!.yourpackage,
                            style: AppStyles.onboardtitle
                                .copyWith(fontSize: 17.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        height: 10.h,
                        decoration: BoxDecoration(
                          color: AppColors.colorgreycard,
                          borderRadius: BorderRadius.all(Radius.circular(2.w)),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 6.h,
                                width: 6.h,
                                decoration: BoxDecoration(
                                    color:
                                        AppColors.primarycolors.withOpacity(.3),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.workspace_premium,
                                  color: AppColors.primarycolors,
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 60.w,
                                          child: Text(
                                            "Messaging",
                                            style: AppStyles.onboardtitle
                                                .copyWith(fontSize: 15.sp),
                                          ),
                                        ),
                                        Text(
                                          "\$20",
                                          style: AppStyles.onboardtitle
                                              .copyWith(
                                                  fontSize: 15.sp,
                                                  color:
                                                      AppColors.primarycolors),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 60.w,
                                          child: Text(
                                            "Chat message with doctor",
                                            maxLines: 1,
                                            style: AppStyles.onboardsubtitle
                                                .copyWith(fontSize: 13.sp),
                                          ),
                                        ),
                                        Text(
                                          "paid",
                                          maxLines: 1,
                                          style: AppStyles.onboardsubtitle
                                              .copyWith(
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
