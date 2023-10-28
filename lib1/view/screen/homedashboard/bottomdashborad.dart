import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/provider/dashboard_Provider.dart';
import 'package:smile_and_go_app/provider/profileprovider.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/showExitPopup.dart';
import 'package:smile_and_go_app/view/screen/ChatScreen/chatPages/chat_list_view.dart';
import 'package:smile_and_go_app/view/screen/appointment/appointmentlist.dart';
import 'package:smile_and_go_app/view/screen/homedashboard/homedashboard.dart';
import 'package:smile_and_go_app/view/screen/profileScreen/profileScreenActivity.dart';

import 'BookDoctorByLocation.dart';

class DashBoardScreenActivity extends StatefulWidget {
  const DashBoardScreenActivity({super.key});

  @override
  State<DashBoardScreenActivity> createState() =>
      _DashBoardScreenActivityState();
}

class _DashBoardScreenActivityState extends State<DashBoardScreenActivity> {
  int _currentIndex = 0;

  bool isHomePageSelected = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List tabs = [];

  onBottomIconPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetdata();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetdata() {
    tabs = [
      ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: HomeDashboardSCreenActivity()),
      AppointmentListScreenActivity(),
      ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: ChattinglistScreenActivity()),
      ChangeNotifierProvider<DashBoradProvider>(
          create: (BuildContext context) => DashBoradProvider(),
          child: BookDoctorByLocation()),
      ChangeNotifierProvider<ProfileUserProvider>(
          create: (BuildContext context) => ProfileUserProvider(),
          child: ProfileScreenActivity()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
        key: _key,
        // drawer: MenuBarScreens(),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        body: SafeArea(child: tabs[_currentIndex]),
        bottomNavigationBar: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.h),
                  topRight: Radius.circular(3.h)),
              child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColors.colorgreycard,
                  iconSize: 17.0,
                  selectedIconTheme: IconThemeData(size: 25.0),
                  selectedItemColor: AppColors.primarycolors,
                  unselectedItemColor: AppColors.secondrycolors,
                  selectedFontSize: 14.sp,
                  unselectedFontSize: 13.sp,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        activeIcon: Icon(Icons.home),
                        label: Languages.of(context)!.home,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.calendar_month_outlined),
                        activeIcon: Icon(Icons.calendar_month),
                        label: Languages.of(context)!.appointment,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.chat_outlined),
                        activeIcon: Icon(Icons.chat),
                        label: Languages.of(context)!.chat,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.location_on),
                        label: Languages.of(context)!.location,
                        backgroundColor: Colors.white),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person_outline_rounded),
                        activeIcon: Icon(Icons.person),
                        label: Languages.of(context)!.profile,
                        backgroundColor: Colors.white),
                  ],
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
