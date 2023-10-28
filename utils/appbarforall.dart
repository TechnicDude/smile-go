import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class AppBarScreens extends StatelessWidget {
  final String? image;
  final String? text;
  final IconData? icon2;
  final Color? backgroundColor;
  final Color? color1;
  final Color? color2;
  final Function()? onTap;
  const AppBarScreens({
    Key? key,
    this.image,
    this.text,
    this.icon2,
    this.color1,
    this.color2,
    this.onTap,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: color1 ?? AppColors.blackColor,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor ?? AppColors.colorswhite,
      title: Text(
        text ?? '',
        style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: onTap,
              icon: Icon(icon2),
              color: color2 ?? AppColors.blackColor,
            ),
          ],
        ),
      ],
    );
  }
}
