import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/appointment/appointmentlist.dart';
import 'package:smile_and_go_app/view/screen/appointment/components/completedcardui.dart';
import '../rescheduleAppointment/AppointmentDetails.dart';

class CompletedAppointmentScreenActivity extends StatefulWidget {
  const CompletedAppointmentScreenActivity({super.key});

  @override
  State<CompletedAppointmentScreenActivity> createState() =>
      _CompletedAppointmentScreenActivityState();
}

class _CompletedAppointmentScreenActivityState
    extends State<CompletedAppointmentScreenActivity> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    _dashBoradProvider.getAll_bookingsService("Completed");
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoradProvider>(
        builder: (context, dashBoradProvider, child) {
      if (dashBoradProvider.patientAppointmentList.isNotEmpty) {
        print("object");
        return Padding(
            padding:
                EdgeInsets.only(top: 1.h, bottom: 4.h, left: 3.w, right: 3.w),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: dashBoradProvider.patientAppointmentList.length,
                itemBuilder: (context, index) {
                  return InkWell(
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CompletedCardUI(
                          patientAppointmentList:
                              dashBoradProvider.patientAppointmentList[index]),
                    ),
                  );
                }));
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
