import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/view/screen/ReviewScreens/components/reviewSCreenUICard.dart';

class ReviewScreensActivity extends StatefulWidget {
  const ReviewScreensActivity({super.key});

  @override
  State<ReviewScreensActivity> createState() => _ReviewScreensActivityState();
}

class _ReviewScreensActivityState extends State<ReviewScreensActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarScreens(
          text: "4.8 (${Languages.of(context)!.reviews})",
          //   icon2: Icons.more_vert_outlined,
        ),
        preferredSize: Size(
            MediaQuery.of(context).size.width, AppBar().preferredSize.height),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) {
            return RevireScreenCardUI();
          }),
    );
  }
}
