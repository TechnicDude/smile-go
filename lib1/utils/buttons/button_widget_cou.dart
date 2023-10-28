import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class ButtonWidgetCou extends StatefulWidget {
  final String? text;
  final Function()? onTap;
  final Color? buttoncolor;
  final Color? buttontextcolor;
  final Color? boardcolor;
  final double? heightbuttom;
  final double? fontsize;

  const ButtonWidgetCou({
    Key? key,
    this.text,
    this.onTap,
    this.buttoncolor,
    this.buttontextcolor,
    this.heightbuttom,
    this.boardcolor,
    this.fontsize,
  }) : super(key: key);

  @override
  State<ButtonWidgetCou> createState() => _ButtonWidgetCouState();
}

class _ButtonWidgetCouState extends State<ButtonWidgetCou> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: widget.heightbuttom ?? 5.h,
          width: 90.w,
          decoration: BoxDecoration(
              color: widget.buttoncolor ?? AppColors.secondrycolors,
              borderRadius: BorderRadius.circular(20.h),
              border:
                  Border.all(color: widget.boardcolor ?? Colors.transparent)),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: Text(
              widget.text ?? '',
              style: AppStyles.onboardsubtitle.copyWith(
                  color: widget.buttontextcolor ?? Colors.white,
                  fontSize: widget.fontsize ?? 16.sp),
            ),
          )),
        ));
  }
}
