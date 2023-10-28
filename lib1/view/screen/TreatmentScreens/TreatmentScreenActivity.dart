import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/treatmentCalenderUI.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/treatmentDays.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/treatmenttimerui.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/treatmentdetails.dart';
import 'package:smile_and_go_app/view/screen/TreatmentScreens/components/weeklysDetails.dart';

class TreatmentScreenActivity extends StatefulWidget {
  const TreatmentScreenActivity({super.key});

  @override
  State<TreatmentScreenActivity> createState() =>
      _TreatmentScreenActivityState();
}

class _TreatmentScreenActivityState extends State<TreatmentScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: Languages.of(context)!.treatment,
          )),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 0.1.h, bottom: 2.h, left: 4.w, right: 4.w),
            child: Column(
              children: [
                WeekLyDetailsScreenActivity(),
                SizedBox(
                  height: 2.h,
                ),
                TreatmenttimerUiScreenActivity(
                  title: "00:38:15",
                  onTap: () {},
                ),
                SizedBox(
                  height: 3.h,
                ),
                Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    BodysDetailsScreenACtivity(
                      title: "Today total aligner time",
                      //Languages.of(context)!.biceps,
                      value: 100.0,
                      time: "3 hours a day",
                      //  icon: AppImages.biceps,
                    ),
                    BodysDetailsScreenACtivity(
                      title: "1:15:00 \nare left",
                      value: 50.0,
                      time: "Today",
                      //icon: AppImages.butt,
                    ),
                    BodysDetailsScreenACtivity(
                      title: "15 Days completed",
                      value: 40.0,
                      time: "15 DAys Left",
                      // icon: AppImages.waist,
                    ),
                    BodysDetailsScreenACtivity(
                      title: "Upcomming Appointment",
                      value: 40.0,
                      time: "28/06/23 | 19:00 PM",
                      // icon: AppImages.leg,
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                //  TreatmentCalenderUI(),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Treatment",
                      style: AppStyles.onboardtitle.copyWith(fontSize: 17.sp),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                TreatmentDaysUiScreenActivity(
                  title: "5 Days",
                  subtitle:
                      "Lorem ipsum is a placeholder text commonly used to demon strate the visual form ",
                  title2: "Photos",
                  onTap: () {},
                ),
                SizedBox(
                  height: 2.h,
                ),
                TreatmentDaysUiScreenActivity(
                  title: "10 Days",
                  subtitle:
                      "Lorem ipsum is a placeholder text commonly used to demon strate the visual form ",
                  title2: "Photos",
                  onTap: () {},
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
