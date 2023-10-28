import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class doctorprofilereviewscreenCard extends StatefulWidget {
  const doctorprofilereviewscreenCard({super.key});

  @override
  State<doctorprofilereviewscreenCard> createState() =>
      _doctorprofilereviewscreenCardState();
}

class _doctorprofilereviewscreenCardState
    extends State<doctorprofilereviewscreenCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorgreycard,
        borderRadius: BorderRadius.all(Radius.circular(2.w)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: 0.5.h, bottom: 0.5.h, left: 2.w, right: 2.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 12.w,
                      width: 12.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(AppImages.onboardingsec))),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "Pinki Kumari",
                      style: AppStyles.onboardtitle.copyWith(fontSize: 14.sp),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.colorswhite,
                          borderRadius: BorderRadius.circular(1.h),
                          border: Border.all(color: AppColors.secondrycolors)),
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 2.5.h,
                              color: AppColors.colorrating,
                            ),
                            SizedBox(
                              width: 1.w,
                            ),
                            Text(
                              "5",
                              style: AppStyles.onboardtitle
                                  .copyWith(fontSize: 15.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    PopupMenuButton(
                        enabled: true,
                        offset: Offset(0, 40),
                        // shape: const TooltipShape(),
                        icon: Icon(
                          Icons.more_vert_outlined,
                          color: AppColors.blackColor,
                        ),
                        itemBuilder: (_) => <PopupMenuEntry>[
                              PopupMenuItem(
                                  child: ListTile(
                                // leading: Icon(
                                //   Icons.edit,
                                //   size: 2.5.h,
                                // ),
                                title: Text(
                                  "Edit",
                                  style: AppStyles.onboardbody,
                                ),
                              )),
                              PopupMenuItem(
                                  child: ListTile(
                                title: Text(
                                  "Delete",
                                  style: AppStyles.onboardbody
                                      .copyWith(color: AppColors.primarycolors),
                                ),
                              )),
                            ]),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 100.w,
                  child: Text(
                    "Lorem ipsum dolor sit amet. Quo repudiandae consequatur At sequi quam et fugit tenetur. Non mollitia quas sit quia dolor aut iusto.",
                    maxLines: 3,
                    style: AppStyles.onboardbody.copyWith(fontSize: 14.sp),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_rounded, //favorite_outline_rounded,
                        size: 2.5.h,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "5",
                        style:
                            AppStyles.onboardsubtitle.copyWith(fontSize: 16.sp),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "5 days ago",
                        style: AppStyles.onboardbody.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
