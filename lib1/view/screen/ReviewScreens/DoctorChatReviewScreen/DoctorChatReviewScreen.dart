import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';

class ChatSessionEndScreenACtivity extends StatefulWidget {
  const ChatSessionEndScreenACtivity({super.key});

  @override
  State<ChatSessionEndScreenACtivity> createState() =>
      _ChatSessionEndScreenACtivityState();
}

class _ChatSessionEndScreenACtivityState
    extends State<ChatSessionEndScreenACtivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(
              text: Languages.of(context)!.sessionended,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(top: 8.h, bottom: 1.h, left: 5.w, right: 5.w),
            child: Column(
              children: [
                Container(
                  width: 25.w,
                  height: 25.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage(AppImages.time)),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "The consultation session has ended.",
                  style: AppStyles.onboardtitle.copyWith(
                      fontSize: 16.sp, color: AppColors.secondrycolors),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Regarding have been saved in activity",
                  style: AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: 30.w,
                  height: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(AppImages.onboardingsec)),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  "Dr. Deepika Mourya",
                  style: AppStyles.onboardtitle.copyWith(
                      fontSize: 16.sp, color: AppColors.secondrycolors),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Immunolisist",
                  style: AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "The valey hospital in california US",
                  style: AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 40.w,
                      child: ButtonWidgetCou(
                        heightbuttom: 4.h,
                        buttoncolor: Colors.transparent,
                        buttontextcolor: AppColors.secondrycolors,
                        boardcolor: AppColors.secondrycolors,
                        fontsize: 14.sp,
                        text: Languages.of(context)!.back,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.chattinglistScreenActivity);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: ButtonWidgetCou(
                        heightbuttom: 4.h,
                        fontsize: 14.sp,
                        text: Languages.of(context)!.leaveareview,
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.writeaReviewScreenACtivity);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
// extension Padding on num {
//   SizedBox get ph => SizedBox(
//         height: toDouble(),
//       );

//   SizedBox get pw => SizedBox(
//         width: toDouble(),
//       );
// }


