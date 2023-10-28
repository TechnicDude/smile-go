import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/bookingapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/provider/appointment_Provider.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';
import 'package:smile_and_go_app/utils/internet_not_connected.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RecheduleAppointmentBooking extends StatefulWidget {
  final String bookingId;
  final String bookingDate;
  final String bookingTime;
  final String doctorId;
  const RecheduleAppointmentBooking({
    super.key,
    required this.bookingId,
    required this.bookingDate,
    required this.bookingTime,
    required this.doctorId,
  });

  @override
  State<RecheduleAppointmentBooking> createState() =>
      _RecheduleAppointmentBooking();
}

class _RecheduleAppointmentBooking extends State<RecheduleAppointmentBooking> {
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
    doctorId = int.parse(widget.doctorId);
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
          doctorId = int.parse(widget.doctorId);
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

  Future reschedul_appointment(String date, String time) async {
    var data = {
      "bookingDate": date.toString(),
      "bookingTime": time.toString(),
    };

    Bookingapi responsedata = Bookingapi(data);
    final response = await responsedata.reschedul_appointment(widget.bookingId);
    bookingResponse = response;
    if (response['status'] == "success") {
      setState(() {
        showpoppScheduleSuccess = true;
      });
    } else {
      DialogHelper.showFlutterToast(strMsg: "This Slot Already booked !");
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
                reschedul_appointment(bookingDate, bookingTime);
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
                                      SfDateRangePicker(
                                        onSelectionChanged: _onSelectionChanged,
                                        minDate:
                                            DateTime.parse(widget.bookingDate),
                                        selectionMode:
                                            DateRangePickerSelectionMode.range,
                                        initialSelectedDate:
                                            DateTime.parse(widget.bookingDate),
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
                                          return Column(
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
                                              data[index].slots!.isNotEmpty
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
                                                        final datas =
                                                            data[index]
                                                                .slots![index1];
                                                        bool? isSelect =
                                                            datas.isAvail;

                                                        return isSelect == true
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
                                                                        child:
                                                                            ButtonWidgetCou(
                                                                          heightbuttom:
                                                                              4.h,
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
                                                                          boardcolor:
                                                                              AppColors.secondrycolors,
                                                                          fontsize:
                                                                              14.sp,
                                                                          text: DateFormat.jm().format(DateFormat("hh:mm").parse(data[index]
                                                                              .slots![index1]
                                                                              .time
                                                                              .toString())),
                                                                          onTap:
                                                                              () {
                                                                            setState(() {
                                                                              bookingTime = data[index].slots![index1].time.toString();

                                                                              bookingDate = data[index].date.toString();
                                                                              selectedIndex = index1;
                                                                              parentSelectedIndex = index;
                                                                            });
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                ],
                                                              )
                                                            : Container();
                                                      }))
                                                  : Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10),
                                                      child: Text(Languages.of(
                                                              context)!
                                                          .slotNotavailavle),
                                                    )
                                            ],
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(clipBehavior: Clip.none, children: [
                                Container(
                                  height: 50.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1.h)),
                                    border: Border.all(
                                        color: AppColors.colorswhite,
                                        width: 0.2),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(1, 2),
                                      ),
                                    ],
                                    gradient: LinearGradient(
                                        colors: [
                                          AppColors.colorswhite,
                                          AppColors.colorswhite
                                        ],
                                        begin: const FractionalOffset(0.0, 0.0),
                                        end: const FractionalOffset(1.0, 0.0),
                                        stops: [0.0, 1.0],
                                        tileMode: TileMode.clamp),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            image: AssetImage(
                                                AppImages.bookappointment),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Rescheduling Success!",
                                              textAlign: TextAlign.center,
                                              style: AppStyles.onboardtitle
                                                  .copyWith(fontSize: 18.sp),
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
                                                  style: AppStyles
                                                      .onboardsubtitle
                                                      .copyWith(
                                                          fontSize: 15.sp),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3.h,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 60.w,
                                                  child: ButtonWidgetCou(
                                                    heightbuttom: 4.h,
                                                    fontsize: 14.sp,
                                                    text: Languages.of(context)!
                                                        .okay,
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ),

                                                SizedBox(
                                                  height: 2.h,
                                                ),

                                                // SizedBox(
                                                //   width: 60.w,
                                                //   child: ButtonWidgetCou(
                                                //     heightbuttom: 4.h,
                                                //     buttoncolor: AppColors
                                                //         .colorgreyButton,
                                                //     buttontextcolor:
                                                //         AppColors.blackColor,
                                                //     boardcolor: AppColors
                                                //         .colorgreyButton,
                                                //     fontsize: 14.sp,
                                                //     text: Languages.of(context)!
                                                //         .cancel,
                                                //     onTap: () {},
                                                //   ),
                                                // ),
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
                          ),
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
