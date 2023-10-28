import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/view/screen/SettingsScreen/ContactusScreenActivity.dart';
import 'package:smile_and_go_app/view/screen/SettingsScreen/FAQScreenActivity.dart';

class HelpCenterScreenActivity extends StatefulWidget {
  const HelpCenterScreenActivity({super.key});

  @override
  State<HelpCenterScreenActivity> createState() =>
      _HelpCenterScreenActivityState();
}

class _HelpCenterScreenActivityState extends State<HelpCenterScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.colorswhite,
          iconTheme: IconThemeData(
            color: AppColors.blackColor,
          ),
          bottom: TabBar(
            labelColor: AppColors.secondrycolors,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.secondrycolors,
            tabs: [
              Tab(text: Languages.of(context)!.contactus),
              Tab(text: Languages.of(context)!.faq),
            ],
          ),
          title: Text(
            Languages.of(context)!.helpnsupport,
            style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
          ),
        ),
        body: TabBarView(
          children: [
            ContactusScreenActivity(),
            FAQScreenActivity(),
          ],
        ),
      ),
    );
  }
}
