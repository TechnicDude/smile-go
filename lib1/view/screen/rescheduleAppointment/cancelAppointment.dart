import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/api/bookingapi.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';
import 'package:smile_and_go_app/utils/cancleappointsuccessPopup.dart';
import 'package:smile_and_go_app/utils/dialoghelper.dart';

class CancelAppointment extends StatefulWidget {
  final String bookingId;

  const CancelAppointment({super.key, required this.bookingId});

  @override
  State<CancelAppointment> createState() => _CancelAppointmentState();
}

class _CancelAppointmentState extends State<CancelAppointment> {
  String radioButtonItem = 'home';
  String resonCancle = '';
  DashBoradProvider _dashBoradProvider = new DashBoradProvider();

  int id = 0;
  bool cancleappointsuccessPopup = false;

  Future cancle_booking(String message) async {
    var data = {
      "cancelReason": message.toString().trim(),
    };

    Bookingapi responsedata = Bookingapi(data);

    final response = await responsedata.cancle_appointment(widget.bookingId);

    if (response['status'] == "success") {
      setState(() {
        _dashBoradProvider.getAll_bookingsService("Pending");
        cancleappointsuccessPopup = true;
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
        text: Languages.of(context)!.next,
        onTap: () {
          if (resonCancle.isNotEmpty) {
            print(resonCancle);
            setState(() {
              cancle_booking(resonCancle);
            });
          } else {
            DialogHelper.showFlutterToast(
                strMsg: Languages.of(context)!.selectReson);
          }
        },
      ),
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarScreens(
            text: Languages.of(context)!.cancelaoppintment,
          )),
      body: Stack(
        children: [
          SingleChildScrollView(
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
                                resonCancle = "I want to change another doctor";
                              });
                            },
                          ),
                          Text(
                            'I want to change another doctor',
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
                                resonCancle =
                                    "I have recovered from the disease";
                              });
                            },
                          ),
                          Text(
                            "I have recovered from the disease",
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
                                resonCancle =
                                    "I have found a suitable mediacine";
                              });
                            },
                          ),
                          Text(
                            "I have found a suitable mediacine",
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
                                resonCancle = "I dont want to consult";
                              });
                            },
                          ),
                          Text(
                            "I dont want to consult",
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 5,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                radioButtonItem = 'id5';
                                id = 5;
                                resonCancle = "I just want to cancel";
                              });
                            },
                          ),
                          Text(
                            "I just want to cancel",
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 6,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                radioButtonItem = 'id6';
                                id = 6;
                                resonCancle = "I dont want to tell";
                              });
                            },
                          ),
                          Text(
                            "I dont want to tell",
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 7,
                            groupValue: id,
                            onChanged: (val) {
                              setState(() {
                                radioButtonItem = 'id7';
                                id = 7;
                                resonCancle = "Others";
                              });
                            },
                          ),
                          Text(
                            "Others",
                            style: TextStyle(fontSize: 14.sp),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.h),
                        child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                resonCancle = value;
                              });
                              print(value);
                            },
                            keyboardType: TextInputType.multiline,
                            minLines: 5,
                            maxLines: 5,
                            readOnly: id == 7 ? false : true,
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
          if (cancleappointsuccessPopup)
            Center(child: CancleappointsuccessPopup(
              callback: (value) {
                setState(() {
                  /// cancleappointsuccessPopup = false;
                  Navigator.pop(context);
                });
              },
            )),
        ],
      ),
    );
  }
}
