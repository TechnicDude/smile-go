// ignore_for_file:

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:smile_and_go_app/utils/nodatafounerror.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/components/notificationcardUI.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/components/topdoctorcardui.dart';

class NotificationScreeenActivity extends StatefulWidget {
  const NotificationScreeenActivity({super.key});

  @override
  State<NotificationScreeenActivity> createState() =>
      _NotificationScreeenActivityState();
}

class _NotificationScreeenActivityState
    extends State<NotificationScreeenActivity> {
  DashBoradProvider _dashBoradProvider = DashBoradProvider();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _dashBoradProvider = Provider.of<DashBoradProvider>(context, listen: false);
    _dashBoradProvider.getNotificationListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBarScreens(
            text: Languages.of(context)!.notifications,
          ),
          preferredSize: Size(
              MediaQuery.of(context).size.width, AppBar().preferredSize.height),
        ),
        body: Consumer<DashBoradProvider>(
            builder: (context, dashBoradProvider, child) {
          if (!dashBoradProvider.getnotificationData) {
            return SizedBox(
                height: 80.h, child: Center(child: LoaderScreennew()));
          } else {
            if (dashBoradProvider.getnotificationLisData.isNotEmpty) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: 1.h, bottom: 2.h, left: 2.w, right: 2.w),
                  child: ListView.builder(
                      itemCount:
                          dashBoradProvider.getnotificationLisData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: NotificationCardUIScreenActivity(
                            dashBoradProvider.getnotificationLisData[index],
                          ),
                        );
                      }));
            } else {
              return NoDataFoundErrorScreens(
                title: Languages.of(context)!.nodatafound,
              );
            }
          }
        }));
  }
}
