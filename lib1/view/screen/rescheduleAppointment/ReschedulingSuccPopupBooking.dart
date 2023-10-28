import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/PatientAppointmentList.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';

class ReschedulingSuccPopupBooking extends StatelessWidget {
  final DoctorDetail doctordetails;
  final bookingResponse;
  final Function? callback;

  const ReschedulingSuccPopupBooking(
      {super.key,
      this.callback,
      required this.doctordetails,
      this.bookingResponse});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(clipBehavior: Clip.none, children: [
          Container(
            height: 50.h,
            width: 80.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(1.h)),
              border: Border.all(color: AppColors.colorswhite, width: 0.2),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 30.w,
                  width: 50.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(AppImages.bookappointment),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Scheduling Success!",
                        textAlign: TextAlign.center,
                        style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Center(
                        child: SizedBox(
                          width: 60.w,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry int rinting and typesetting.",
                            maxLines: 3,
                            style: AppStyles.onboardsubtitle
                                .copyWith(fontSize: 15.sp),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 60.w,
                            child: ButtonWidgetCou(
                              heightbuttom: 4.h,
                              fontsize: 14.sp,
                              text: Languages.of(context)!.viewappointment,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.viewAppointmentScreen,
                                  arguments: {
                                    AppStringFile.doctordetails: doctordetails,
                                    AppStringFile.bookingResponse:
                                        bookingResponse ?? ''
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            width: 60.w,
                            child: ButtonWidgetCou(
                              heightbuttom: 4.h,
                              buttoncolor: AppColors.colorgreyButton,
                              buttontextcolor: AppColors.blackColor,
                              boardcolor: AppColors.colorgreyButton,
                              fontsize: 14.sp,
                              text: Languages.of(context)!.cancel,
                              onTap: () {
                                callback!("ok");
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
