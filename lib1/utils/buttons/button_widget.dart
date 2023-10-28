import 'package:flutter/material.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class ButtonWidget extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  const ButtonWidget({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: 5.h,

          // width: 90.w,
          decoration: BoxDecoration(
            color: AppColors.secondrycolors,
            borderRadius: BorderRadius.circular(20.h),
            // boxShadow: [
            //   BoxShadow(
            //     spreadRadius: 4,
            //     blurRadius: 10,
            //     offset: Offset(-1, 3),
            //   )
            // ],
          ),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: Text(
              widget.text ?? '',
              style: AppStyles.onboardsubtitle
                  .copyWith(color: Colors.white, fontSize: 16.sp),
            ),
          )),
        ));
  }
}
