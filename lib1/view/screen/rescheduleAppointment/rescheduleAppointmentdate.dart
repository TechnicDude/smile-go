import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/apphelper.dart';
import 'package:smile_and_go_app/api/bookingapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/model/favoritedoctormodel.dart';
import 'package:smile_and_go_app/model/todoctorslistModel.dart';
import 'package:smile_and_go_app/provider/appointment_Provider.dart';
import 'package:smile_and_go_app/provider/favoritedoctorprovider.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/internet_not_connected.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/utils/reschedulingsuccPopup.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class RescheduleAppointmentDate extends StatefulWidget {
  final TopdoctorslistData doctordetails;
  const RescheduleAppointmentDate({super.key, required this.doctordetails});

  @override
  State<RescheduleAppointmentDate> createState() =>
      _RescheduleAppointmentDateState();
}

// bool? hour1 = true;
// bool hour2 = false;
// bool hour3 = false;
// bool hour4 = false;
// bool hour5 = false;
// bool hour6 = false;
// bool hour7 = false;
// bool hour8 = false;
// bool hour9 = false;
// bool hour10 = false;
// bool hour11 = false;
// bool hour12 = false;
// bool hour13 = false;
// bool hour14 = false;
// bool hour15 = false;
// bool hour16 = false;
// bool hour17 = false;
// bool hour18 = false;
// bool hour19 = false;
// bool hour20 = false;

class _RescheduleAppointmentDateState extends State<RescheduleAppointmentDate> {
  AppointmentServices _appointmentServices = AppointmentServices();
  final f = DateFormat('hh:mm a');

  late var bookingResponse;
  int selectedIndex = 0;
  int parentSelectedIndex = 0;
  String radioButtonItem = 'home';
  bool showpoppScheduleSuccess = false;
  int id = 1;
  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  int? doctorId;
  bool isSelectedColor = false;
  String bookingDate = '';
  String bookingTime = '';

  @override
  void initState() {
    super.initState();
    doctorId = widget.doctordetails.id;
    _appointmentServices =
        Provider.of<AppointmentServices>(context, listen: false);
    _appointmentServices.doctor_availability(doctorId!, "", "", "");
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      _range = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)} -'
          // ignore: lines_longer_than_80_chars
          ' ${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
      print("fgdhgghjh" + _range);

      if (DateFormat('yyyy-MM-dd').format(args.value.startDate) !=
          (DateFormat('yyyy-MM-dd')
              .format(args.value.endDate ?? args.value.startDate))) {
        setState(() {
          doctorId = widget.doctordetails.id;
          _appointmentServices.doctor_availability(
              doctorId!,
              DateFormat('yyyy-MM-dd').format(args.value.startDate),
              (DateFormat('yyyy-MM-dd')
                  .format(args.value.endDate ?? args.value.startDate)),
              "");
        });
      }
    } else if (args.value is DateTime) {
      _selectedDate = args.value.toString();
    } else if (args.value is List<DateTime>) {
      _dateCount = args.value.length.toString();
    } else {
      _rangeCount = args.value.length.toString();
    }
  }

  Future create_booking(String date, String time) async {
    var data = {
      "locationId": "6",
      "doctorId": widget.doctordetails.id.toString(),
      "patientId": int.parse(AppHelper.userid.toString()),
      "bookingDate": date.toString(),
      "bookingTime": time.toString(),
      "bookingAmount": "500",
      "bookingMethod": "Online"
    };

    Bookingapi responsedata = Bookingapi(data);

    final response = await responsedata.create_appointment();
    bookingResponse = response;

    if (response['status'] == "success") {
      setState(() {
        showpoppScheduleSuccess = true;
      });
    } else {
      DialogHelper.showFlutterToast(strMsg: "This Slot Already booked !");
    }
  }

  bool datecampare(String date) {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    String formattedDate2 =
        formatter.format(DateFormat("yyyy-MM-dd").parse(date));

    // print("hello");
    // print(formattedDate + "  " + date); // 2016-01-25

    if (formattedDate.toString() == formattedDate2.toString()) {
      return true;
    } else {
      return false;
    }
  }

  bool campareTime(String time) {
    String currentTime = DateFormat('h:mm').format(DateTime.now());

    int currentTime2 = int.parse(currentTime.replaceAll(':', '').trim());
    int slotTime2 = int.parse(time.replaceAll(':', '').trim());

    if (slotTime2 < currentTime2) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: ButtonWidgetCou(
            heightbuttom: 5.h,
            boardcolor: AppColors.colorgreyButton,
            fontsize: 14.sp,
            text: Languages.of(context)!.submit,
            onTap: () {
              print("bookingDate  " + bookingDate);
              print("bookingTime  " + bookingTime);

              if (bookingDate.isNotEmpty && bookingTime.isNotEmpty) {
                create_booking(bookingDate, bookingTime);
              } else {
                DialogHelper.showFlutterToast(
                    strMsg: Languages.of(context)!.selectdate);
              }
            }),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(
              text: Languages.of(context)!.appointment,
            )),
        body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected
            ? InternetNotAvailable()
            : Consumer<AppointmentServices>(
                builder: (context, appointmentServices, child) {
                if (!appointmentServices.datanotfound) {
                  SizedBox(
                      height: 80.h, child: Center(child: LoaderScreennew()));
                }
                {
                  if (appointmentServices.datanotfound) {
                    return Stack(
                      children: [
                        SafeArea(
                            child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 1.h, bottom: 4.h, left: 4.w, right: 4.w),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Select Date",
                                            style: AppStyles.onboardtitle
                                                .copyWith(fontSize: 17.sp),
                                          ),
                                        ],
                                      ),

                                      // Row(
                                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Text(
                                      //       "June 2023 Date",
                                      //       style: AppStyles.onboardtitle
                                      //           .copyWith(fontSize: 16.sp),
                                      //     ),
                                      //     Row(
                                      //       children: [
                                      //         Icon(
                                      //           Icons.arrow_left_sharp,
                                      //           size: 4.h,
                                      //         ),
                                      //         Icon(
                                      //           Icons.arrow_right_sharp,
                                      //           color: AppColors.primarycolors,
                                      //           size: 4.h,
                                      //         ),
                                      //       ],
                                      //     )
                                      //   ],
                                      // ),

                                      // TableCalendar(
                                      //   // firstDay: DateTime.utc(2021, 10, 20),
                                      //   firstDay: DateTime.now(),
                                      //   lastDay: DateTime.utc(2050, 10, 20),
                                      //   focusedDay: DateTime.now(),
                                      //   headerVisible: true,
                                      //   daysOfWeekVisible: true,
                                      //   sixWeekMonthsEnforced: true,
                                      //   shouldFillViewport: false,
                                      //   rowHeight: 35,
                                      //   onDaySelected: (selectedDay, focusedDay) {
                                      //     print("datat" +
                                      //         selectedDay.toString() +
                                      //         focusedDay.toString());
                                      //   },
                                      //   headerStyle: HeaderStyle(
                                      //       // formatButtonDecoration: BoxDecoration(
                                      //       //   color: Colors.brown,
                                      //       //   borderRadius: BorderRadius.circular(22.0),
                                      //       // ),
                                      //       // formatButtonTextStyle:
                                      //       //     TextStyle(color: Colors.white),
                                      //       formatButtonShowsNext: false,
                                      //       titleTextStyle: AppStyles.onboardtitle.copyWith(
                                      //           fontSize: 16.sp,
                                      //           color: AppColors.blackColor)),
                                      //   calendarStyle: CalendarStyle(
                                      //       todayTextStyle: AppStyles.onboardtitle.copyWith(
                                      //           fontSize: 16.sp,
                                      //           color: AppColors.colorswhite)),
                                      // ),

                                      SfDateRangePicker(
                                        onSelectionChanged: _onSelectionChanged,
                                        minDate: DateTime.now(),
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                      ),

                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Select Hour",
                                            style: AppStyles.onboardtitle
                                                .copyWith(fontSize: 17.sp),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),

                                      ListView.builder(
                                        itemCount: appointmentServices
                                            .abavailabilityDates.length,
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context, index) {
                                          final data = appointmentServices
                                              .abavailabilityDates;
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(DateFormat.yMMMMd(
                                                        Languages.of(context)!
                                                            .LanguageType)
                                                    .format(
                                                        DateFormat("yyyy-MM-dd")
                                                            .parse(data[index]
                                                                .date
                                                                .toString()
                                                                .toString()))),
                                                SizedBox(
                                                  height: .5.h,
                                                ),
                                                data[index].slots!.length > 0
                                                    ? GridView.count(
                                                        shrinkWrap: true,
                                                        primary: false,
                                                        crossAxisSpacing: 1.5,
                                                        mainAxisSpacing: 1,
                                                        crossAxisCount: 4,
                                                        childAspectRatio: 1.6,
                                                        children: List.generate(
                                                            data[index]
                                                                .slots!
                                                                .length,
                                                            (index1) {
                                                          final datas = data[
                                                                  index]
                                                              .slots![index1];
                                                          bool? isSelect =
                                                              datas.isAvail;

                                                          return isSelect ==
                                                                  true
                                                              ? Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        SizedBox(
                                                                            width:
                                                                                20.w,
                                                                            child: datecampare(data[index].date.toString().toString())
                                                                                ? campareTime(data[index].slots![index1].time.toString())
                                                                                    ? ButtonWidgetCou(
                                                                                        heightbuttom: 4.h,
                                                                                        buttoncolor: parentSelectedIndex == index
                                                                                            ? selectedIndex == index1
                                                                                                ? Colors.black
                                                                                                : Colors.transparent
                                                                                            : Colors.transparent,
                                                                                        buttontextcolor: parentSelectedIndex == index
                                                                                            ? selectedIndex == index1
                                                                                                ? Colors.white
                                                                                                : AppColors.secondrycolors
                                                                                            : AppColors.secondrycolors,
                                                                                        boardcolor: AppColors.secondrycolors,
                                                                                        fontsize: 14.sp,
                                                                                        text: DateFormat.jm().format(DateFormat("hh:mm").parse(data[index].slots![index1].time.toString())),
                                                                                        onTap: () {
                                                                                          setState(() {
                                                                                            bookingTime = data[index].slots![index1].time.toString();

                                                                                            bookingDate = data[index].date.toString();
                                                                                            selectedIndex = index1;
                                                                                            parentSelectedIndex = index;
                                                                                          });
                                                                                        },
                                                                                      )
                                                                                    : SizedBox()
                                                                                : ButtonWidgetCou(
                                                                                    heightbuttom: 4.h,
                                                                                    buttoncolor: parentSelectedIndex == index
                                                                                        ? selectedIndex == index1
                                                                                            ? Colors.black
                                                                                            : Colors.transparent
                                                                                        : Colors.transparent,
                                                                                    buttontextcolor: parentSelectedIndex == index
                                                                                        ? selectedIndex == index1
                                                                                            ? Colors.white
                                                                                            : AppColors.secondrycolors
                                                                                        : AppColors.secondrycolors,
                                                                                    boardcolor: AppColors.secondrycolors,
                                                                                    fontsize: 14.sp,
                                                                                    text: DateFormat.jm().format(DateFormat("hh:mm").parse(data[index].slots![index1].time.toString())),
                                                                                    onTap: () {
                                                                                      setState(() {
                                                                                        bookingTime = data[index].slots![index1].time.toString();

                                                                                        bookingDate = data[index].date.toString();
                                                                                        selectedIndex = index1;
                                                                                        parentSelectedIndex = index;
                                                                                      });
                                                                                    },
                                                                                  )),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          2.h,
                                                                    ),
                                                                  ],
                                                                )
                                                              : Container();
                                                        }))
                                                    : Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1),
                                                        child: Text(Languages
                                                                .of(context)!
                                                            .slotNotavailavle),
                                                      ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),

                                      SizedBox(
                                        height: 4.h,
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        )),
                        if (showpoppScheduleSuccess)
                          Center(
                              child: ReschedulingSuccPopup(
                            callback: (value) {
                              setState(() {
                                showpoppScheduleSuccess = false;
                              });
                            },
                            doctordetails: widget.doctordetails,
                            bookingResponse: bookingResponse,
                          )),
                      ],
                    );
                  } else {
                    return NoDataFoundErrorScreens(
                      title: Languages.of(context)!.nodatafound,
                    );
                  }
                }
              }));
  }
}
