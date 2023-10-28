import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/appointment/components/upcommingcardui.dart';
import 'package:smile_and_go_app/view/screen/rescheduleAppointment/AppointmentDetails.dart';

class UpcommingAppointmentScreenActivity extends StatefulWidget {
  const UpcommingAppointmentScreenActivity({super.key});

  @override
  State<UpcommingAppointmentScreenActivity> createState() =>
      _UpcommingAppointmentScreenActivityState();
}

class _UpcommingAppointmentScreenActivityState
    extends State<UpcommingAppointmentScreenActivity> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    _dashBoradProvider.getAll_bookingsService("Pending");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      if (dashBoradProvider.patientAppointmentList.isNotEmpty) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                    top: 1.h, bottom: 4.h, left: 3.w, right: 3.w),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: dashBoradProvider.patientAppointmentList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppointmentDetails(
                                        doctordetails: dashBoradProvider
                                            .patientAppointmentList[index],
                                      )),
                            );
                          },
                          child: Column(
                            children: [
                              // SizedBox(
                              //   height: 3.h,
                              // ),
                              // Center(
                              //   child: Container(
                              //     height: 20.w,
                              //     width: 20.w,
                              //     decoration: BoxDecoration(
                              //       borderRadius: BorderRadius.only(
                              //         topLeft: Radius.circular(10),
                              //         bottomLeft: Radius.circular(10),
                              //         bottomRight: Radius.circular(10),
                              //       ),
                              //       image: DecorationImage(
                              //         fit: BoxFit.fill,
                              //         image: AssetImage(AppImages.onboardingsec),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 2.h,
                              // ),
                              // Text(
                              //   dashBoradProvider.patientAppointmentList[index]
                              //       .doctorDetail!.firstName
                              //       .toString(),
                              //   style: AppStyles.onboardtitle
                              //       .copyWith(fontSize: 15.sp),
                              // ),
                              Container(
                                child: UpcomingCradUIScreeenActivity(
                                    patientAppointmentList: dashBoradProvider
                                        .patientAppointmentList[index]),
                              )

                              // ListView.builder(
                              //     shrinkWrap: true,
                              //     physics: ScrollPhysics(),
                              //     scrollDirection: Axis.vertical,
                              //     itemCount: dashBoradProvider
                              //         .patientAppointmentList.length,
                              //     itemBuilder: (context, index) {
                              //       return
                              //       UpcomingCradUIScreeenActivity(
                              //           patientAppointmentList: dashBoradProvider
                              //               .patientAppointmentList[index]);
                              //     })
                            ],
                          ),
                        ),
                      );
                    })),
          ),
        );
      } else {
        if (dashBoradProvider.getAllBookingData == false) {
          return SizedBox(
              height: 80.h, child: Center(child: LoaderScreennew()));
        } else {
          return NoDataFoundErrorScreens(
            title: Languages.of(context)!.nodatafound,
          );
        }
      }
    });
  }
}
