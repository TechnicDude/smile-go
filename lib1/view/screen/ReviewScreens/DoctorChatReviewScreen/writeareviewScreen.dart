import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';
import 'package:smile_and_go_app/utils/buttons/button_widget_cou.dart';
import 'package:smile_and_go_app/utils/reviewsuccessfullPopup.dart';

class WriteaReviewScreenACtivity extends StatefulWidget {
  const WriteaReviewScreenACtivity({super.key});

  @override
  State<WriteaReviewScreenACtivity> createState() =>
      _WriteaReviewScreenACtivityState();
}

class _WriteaReviewScreenACtivityState
    extends State<WriteaReviewScreenACtivity> {
  bool reviewsuccessfullPopup = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(
              text: Languages.of(context)!.writeareview,
            )),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 8.h, bottom: 1.h, left: 5.w, right: 5.w),
                child: Column(
                  children: [
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
                      "How was your experience \nwith Dr. Deepika Mourya?",
                      style:
                          AppStyles.onboardsubtitle.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // RatingBar.builder(
                    //   initialRating: //apprating,
                    //   minRating: 1,
                    //   direction: Axis.horizontal,
                    //   allowHalfRating: true,
                    //   itemCount: 5,
                    //   itemSize: 20,
                    //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    //   itemBuilder: (context, _) => Icon(
                    //     Icons.star,
                    //     color: Colors.amber,
                    //   ),
                    //   onRatingUpdate: (rating) {
                    //     print(rating);
                    //   },
                    // ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),

                    SizedBox(
                      height: 6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          Languages.of(context)!.writeareview,
                          style: AppStyles.onboardtitle.copyWith(
                              fontSize: 16.sp, color: AppColors.secondrycolors),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 5,
                          // maxLength: 1000,

                          decoration: InputDecoration(
                            hintText: Languages.of(context)!.writeareview,
                            fillColor: Colors.white,
                            hintStyle: AppStyles.onboardsubtitle.copyWith(
                                fontSize: 14.sp, color: AppColors.colorgrey),
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
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      child: ButtonWidgetCou(
                        heightbuttom: 4.h,
                        fontsize: 14.sp,
                        text: Languages.of(context)!.submit,
                        onTap: () {
                          setState(() {
                            reviewsuccessfullPopup = true;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (reviewsuccessfullPopup)
              Center(child: ReviewsuccessfullPopup(
                callback: (value) {
                  setState(() {
                    reviewsuccessfullPopup = false;
                  });
                },
              )),
          ],
        ));
  }
}
