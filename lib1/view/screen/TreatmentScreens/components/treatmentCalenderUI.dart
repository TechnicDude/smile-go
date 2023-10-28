import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class TreatmentCalenderUI extends StatefulWidget {
  const TreatmentCalenderUI({super.key});

  @override
  State<TreatmentCalenderUI> createState() => _TreatmentCalenderUIState();
}

class _TreatmentCalenderUIState extends State<TreatmentCalenderUI> {
  DateTime? startdate;
  int? weekname;

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  List check = [true, false, false, false, false, false, false];
  List weeklist = [true, false, false, false];

  bool adddatashow = false;
  bool editdatashow = false;
  int contextindex = 0;

  // TODO: implement initState

  fetchdata() async {
    /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
    int numOfWeeks(int year) {
      DateTime dec28 = DateTime(year, 12, 28);
      int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
      return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
    }

    int weekNumbers(DateTime date) {
      int dayOfYear = int.parse(DateFormat("D").format(date));
      print(((dayOfYear - date.weekday + 10) / 7).floor());
      var week = ((dayOfYear - date.weekday + 10) / 7).floor();
      if (week == weekname) {
        for (int i = 0; i < weeklist.length; i++) {
          weeklist[i] = false;
        }
        weeklist[0] = true;
      } else if (week == (weekname! + 1)) {
        for (int i = 0; i < weeklist.length; i++) {
          weeklist[i] = false;
        }
        weeklist[1] = true;
      } else if (week == (weekname! + 2)) {
        for (int i = 0; i < weeklist.length; i++) {
          weeklist[i] = false;
        }
        weeklist[2] = true;
      }
      return ((dayOfYear - date.weekday + 10) / 7).floor();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      //color: Colors.yellow,
      child: ListView.builder(
          itemCount: 7,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(2.h),
              child: InkWell(
                onTap: () {
                  for (int i = 0; i < check.length; i++) {
                    setState(() {
                      check[i] = false;
                    });
                  }
                  setState(() {
                    check[index] = true;
                  });
                },
                child: Container(
                  height: 10.h,
                  width: 4.2.h,
                  decoration: BoxDecoration(
                    color: check[index]
                        ? AppColors.secondrycolors
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 1.5.h),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat('EE', "en")
                                .format(
                                    startdate!.add(new Duration(days: index)))
                                .toString(),
                            style: AppStyles.onboardbody.copyWith(
                                color: check[index]
                                    ? AppColors.colorswhite
                                    : Colors.black,
                                fontSize: 16.sp),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0.2.h),
                            child: Container(
                              height: 3.h,
                              width: 3.h,
                              decoration: BoxDecoration(
                                color: AppColors.colorswhite,
                                borderRadius: BorderRadius.circular(2.h),
                              ),
                              child: Center(
                                child: Text(
                                  startdate!
                                      .add(Duration(days: index))
                                      .day
                                      .toString(),
                                  style: AppStyles.onboardbody.copyWith(
                                      color: check[index]
                                          ? AppColors.secondrycolors
                                          : Colors.black,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
