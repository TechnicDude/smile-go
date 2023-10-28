import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/PatientAppointmentList.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';
import 'package:smile_and_go_app/view/screen/ReviewScreens/components/doctorprofilereviewscreenCard.dart';

class AppointmentDetails extends StatefulWidget {
  final Data doctordetails;

  const AppointmentDetails({super.key, required this.doctordetails});

  @override
  State<AppointmentDetails> createState() =>
      _DoctorDetailsScreenActivityState();
}

class _DoctorDetailsScreenActivityState extends State<AppointmentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.colorswhite,
          ),
          backgroundColor: AppColors.secondrycolors,
          elevation: 0,
          title: Text(
            Languages.of(context)!.appointmentdetails,
          )),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 38.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 100.h,
                  color: AppColors.secondrycolors,
                ),
                Container(
                  height: 30.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: AppColors.colorswhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Stack(
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 6.h,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.doctordetails != null
                                          ? widget.doctordetails.doctorDetail!
                                              .firstName
                                              .toString()
                                          : '',
                                      style: AppStyles.onboardtitle
                                          .copyWith(fontSize: 17.sp),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      widget.doctordetails != null
                                          ? widget.doctordetails.doctorDetail!
                                              .lastName
                                              .toString()
                                          : '',
                                      style: AppStyles.onboardtitle
                                          .copyWith(fontSize: 17.sp),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.business_center_outlined,
                                      size: 2.2.h,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      widget.doctordetails.doctorDetail!
                                                  .doctorProfiles !=
                                              null
                                          ? widget.doctordetails.doctorDetail!
                                              .doctorProfiles!.specialty!
                                          : '',
                                      style: AppStyles.onboardbody,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.call,
                                      size: 2.2.h,
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      widget.doctordetails.locationDetail !=
                                              null
                                          ? widget.doctordetails.locationDetail!
                                              .contactNumber!
                                          : '',
                                      style: AppStyles.onboardbody,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.h),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.colorgreycard,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 1.h,
                                      bottom: 1.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      doctordetails(
                                          Icons.person, "5000+", "Patients"),
                                      doctordetails(
                                          Icons.business_center,
                                          widget.doctordetails.doctorDetail!
                                                      .doctorProfiles !=
                                                  null
                                              ? widget
                                                  .doctordetails
                                                  .doctorDetail!
                                                  .doctorProfiles!
                                                  .experienceInIndustry!
                                              : '',
                                          "Years Exp.."),
                                      doctordetails(
                                          Icons.star, "4.9", "rating"),
                                      doctordetails(
                                          Icons.person, "5065", "reviews"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            top: -7.h,
                            child: Container(
                              height: 25.w,
                              width: 25.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                  image: widget.doctordetails.doctorDetail!
                                              .userAvatar !=
                                          null
                                      ? NetworkImage(APIURL.imageurl +
                                          widget.doctordetails.doctorDetail!
                                              .userAvatar!)
                                      : AssetImage(AppImages.onboardingsec)
                                          as ImageProvider,
                                  //AssetImage(AppImages.onboardingsec))),
                                ),
                              ),
                            )),
                      ]),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.h, left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Languages.of(context)!.about,
                  style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),

                Text(
                  widget.doctordetails.doctorDetail!.doctorProfiles != null
                      ? widget.doctordetails.doctorDetail!.doctorProfiles!
                          .professionalBio!
                      : '',
                ),
                SizedBox(
                  height: 1.h,
                ),
                widget.doctordetails.cancelReason != null
                    ? Text(
                        Languages.of(context)!.cancelReason,
                        style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                      )
                    : SizedBox(),
                widget.doctordetails.cancelReason != null
                    ? SizedBox(
                        height: 1.h,
                      )
                    : Center(),
                widget.doctordetails.cancelReason != null
                    ? Text(
                        widget.doctordetails != null
                            ? widget.doctordetails.cancelReason!
                            : '',
                      )
                    : Center(),

                //"Lorem ipsum dolor sit amet. Quo repudiandae consequatur At sequi quam et fugit tenetur. Non mollitia quas sit quia dolor aut iusto consequatur aut dolor reiciendis sit animi dignissimos qui accusamus laborum. Sed consequuntur necessitatibus sed iste quia est amet aliquam sit porroplaceat."),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  Languages.of(context)!.bookingDate,
                  style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),

                Text(
                  widget.doctordetails.doctorDetail!.doctorProfiles != null
                      ? DateFormat.yMMMMd(Languages.of(context)!.LanguageType)
                              .format(DateFormat("yyyy-MM-dd").parse(widget
                                  .doctordetails.bookingDate
                                  .toString())) +
                          " | " +
                          DateFormat.jm().format(DateFormat("hh:mm").parse(
                              widget.doctordetails.bookingTime.toString()))
                      : '',

                  //"Monday - Friday, 8:00 AM - 20:00 PM",
                  style: AppStyles.onboardbody,
                ),

                SizedBox(
                  height: 1.h,
                ),
                Text(
                  Languages.of(context)!.bookingAmount,
                  style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),

                Text(
                  widget.doctordetails != null
                      ? widget.doctordetails.bookingAmount.toString() + "\$"
                      : '',
                  style: AppStyles.onboardbody,
                ),

                SizedBox(
                  height: 1.h,
                ),
                Text(
                  Languages.of(context)!.address,
                  style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Text(
                      "${widget.doctordetails.locationDetail != null ? widget.doctordetails.locationDetail!.country! : ''},",
                      style: AppStyles.onboardbody,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      "${widget.doctordetails.locationDetail != null ? widget.doctordetails.locationDetail!.city! : ''},",
                      style: AppStyles.onboardbody,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      "${widget.doctordetails.locationDetail != null ? widget.doctordetails.locationDetail!.state! : ''},",
                      style: AppStyles.onboardbody,
                    ),
                  ],
                ),
                Text(
                  widget.doctordetails.locationDetail != null
                      ? widget.doctordetails.locationDetail!.pincode.toString()
                      : '',
                  style: AppStyles.onboardbody,
                ),

                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Languages.of(context)!.reviews,
                      style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.reviewScreensActivity);
                      },
                      child: Text(
                        Languages.of(context)!.seeall,
                        style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),

                doctorprofilereviewscreenCard(),
                // Column(
                //   children: [
                //     Row(
                //       children: [
                //         Container(
                //           height: 14.w,
                //           width: 14.w,
                //           decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               image: DecorationImage(
                //                   fit: BoxFit.fill,
                //                   image: AssetImage(AppImages.onboardingsec))),
                //         ),
                //         SizedBox(
                //           width: 2.w,
                //         ),
                //         Text(
                //           "Pinki Kumari",
                //           style:
                //               AppStyles.onboardtitle.copyWith(fontSize: 14.sp),
                //         ),
                //         Spacer(),
                //         Container(
                //           decoration: BoxDecoration(
                //               color: AppColors.colorswhite,
                //               borderRadius: BorderRadius.circular(10),
                //               border:
                //                   Border.all(color: AppColors.primarycolors)),
                //           child: Padding(
                //             padding: EdgeInsets.all(12.0),
                //             child: Row(
                //               children: [
                //                 Text("5"),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ],
                //     ),
                //     SizedBox(
                //       height: 2.h,
                //     ),
                //     Text(
                //       "Lorem ipsum dolor sit amet. Quo repudiandae consequatur At sequi quam et fugit tenetur. Non mollitia quas sit quia dolor aut iusto.",
                //       style: AppStyles.onboardbody.copyWith(fontSize: 14.sp),
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget doctordetails(IconData? icon, String details, String type) {
    return Column(
      children: [
        Container(
          height: 4.h,
          width: 4.h,
          decoration: BoxDecoration(
              color: AppColors.primarycolors.withOpacity(.3),
              shape: BoxShape.circle),
          child: Icon(
            icon,
            color: AppColors.primarycolors,
          ),
        ),
        Text(
          details,
          style: AppStyles.onboardtitle
              .copyWith(fontSize: 15.sp, color: AppColors.primarycolors),
        ),
        Text(
          type,
          style: AppStyles.onboardbody.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }
}
