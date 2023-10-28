import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/view/screen/appointment/cancelleduishow.dart';
import 'package:smile_and_go_app/view/screen/appointment/completeduishow.dart';
import 'package:smile_and_go_app/view/screen/appointment/upcomingappointment.dart';

class AppointmentListScreenActivity extends StatefulWidget {
  const AppointmentListScreenActivity({super.key});

  @override
  State<AppointmentListScreenActivity> createState() =>
      _AppointmentListScreenActivityState();
}

class _AppointmentListScreenActivityState
    extends State<AppointmentListScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.colorswhite,
          bottom: TabBar(
            labelColor: AppColors.secondrycolors,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.secondrycolors,
            tabs: [
              // Tab(text: Languages.of(context)!.upcoming),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                color: AppColors.colorswhite,
                child: Text(
                  Languages.of(context)!.upcoming,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                color: AppColors.colorswhite,
                child: Text(
                  Languages.of(context)!.completed,
                  style: TextStyle(color: Colors.green),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                color: AppColors.colorswhite,
                child: Text(
                  Languages.of(context)!.cancelled,
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ),

              //Tab(text: Languages.of(context)!.completed),
              //Tab(text: Languages.of(context)!.cancelled),
            ],
          ),
          title: Text(
            Languages.of(context)!.myappointment,
            style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
          ),
          actions: [
            
            // Icon(
            //   Icons.search,
            //   color: AppColors.primarycolors,
            // ),
            // SizedBox(
            //   width: 2.w,
            // ),
            // Icon(
            //   Icons.add_circle_outline_outlined,
            //   color: AppColors.primarycolors,
            // ),
            // SizedBox(
            //   width: 2.w,
            // )
         
          ],
        ),
        body: TabBarView(
          children: [
            ChangeNotifierProvider<DashBoradProvider>(
                create: (BuildContext context) => DashBoradProvider(),
                child: UpcommingAppointmentScreenActivity()),
            ChangeNotifierProvider<DashBoradProvider>(
                create: (BuildContext context) => DashBoradProvider(),
                child: CompletedAppointmentScreenActivity()),
            ChangeNotifierProvider<DashBoradProvider>(
                create: (BuildContext context) => DashBoradProvider(),
                child: CancelledAppointmentScreenActivity()),
          ],
        ),
      ),
    );
  }
}
