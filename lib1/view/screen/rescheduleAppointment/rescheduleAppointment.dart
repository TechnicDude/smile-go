import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/DoctorAvailabilityModel.dart';
import 'package:smile_and_go_app/model/PatientAppointmentList.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/app_string.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';

class RescheduleAppointment extends StatefulWidget {
  String bookingId;
  String bookingDate;
  String bookingTime;
  String doctorId;

  RescheduleAppointment(
      {super.key,
      required this.bookingId,
      required this.bookingDate,
      required this.bookingTime,
      required this.doctorId});

  @override
  State<RescheduleAppointment> createState() => _RescheduleAppointmentState();
}

class _RescheduleAppointmentState extends State<RescheduleAppointment> {
  String radioButtonItem = 'home';
  String resonReschedule = '';

  int id = 1;
  @override
  Widget build(BuildContext context) {
    print(widget.bookingId +
        " gfghghjhj    " +
        widget.bookingDate +
        "    " +
        widget.bookingTime +
        "   " +
        widget.doctorId);
    return Scaffold(
      floatingActionButton: ButtonWidgetCou(
        heightbuttom: 5.h,
        boardcolor: AppColors.colorgreyButton,
        fontsize: 14.sp,
        text: Languages.of(context)!.next,
        onTap: () {
          //    if (resonCancle.isNotEmpty)
          //    {
          //   print(resonCancle);
          //   setState(() {
          //     cancle_booking(resonCancle);
          //   });
          // }

          Navigator.pushNamed(context, Routes.recheduleAppointmentBooking,
              arguments: {
                AppStringFile.bookingId: widget.bookingId.toString(),
                AppStringFile.bookingDate: widget.bookingDate.toString(),
                AppStringFile.bookingTime: widget.bookingTime.toString(),
                AppStringFile.doctorId: widget.doctorId.toString(),
              });
        },
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: Languages.of(context)!.appointment,
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 1.h, bottom: 4.h, left: 3.w, right: 3.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason for Schedule change",
                  style: AppStyles.onboardtitle.copyWith(fontSize: 16.sp),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'home';
                              id = 1;
                              resonReschedule = "home";
                            });
                          },
                        ),
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'id2';
                              id = 2;
                              resonReschedule =
                                  "I 'm not available on schedule";
                            });
                          },
                        ),
                        Text(
                          "I 'm not available on schedule",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 3,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'id3';
                              id = 3;
                              resonReschedule = "I don't want to tell";
                            });
                          },
                        ),
                        Text(
                          "I don't want to tell",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: 4,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'id4';
                              id = 4;
                              resonReschedule = "Others";
                            });
                          },
                        ),
                        Text(
                          "Others",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.h),
                      child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 5,
                          onChanged: (value) {
                            setState(() {
                              resonReschedule = value;
                            });
                            print(value);
                          },
                          readOnly: id == 4 ? false : true,
                          decoration: InputDecoration(
                            hintText: "please enter your reason",
                            fillColor: Colors.white,
                            hintStyle: AppStyles.onboardsubtitle
                                .copyWith(fontSize: 14.sp),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(1.h),
                                borderSide:
                                    BorderSide(color: AppColors.blackColor)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.colorgrey),
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
