import 'package:flutter/material.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';

class IconwithBackgroundUI extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final Color? backgroundColor;
  final Function()? onTap;
  final double? height;
  final double? width;
  const IconwithBackgroundUI({
    super.key,
    this.icon,
    this.size,
    this.onTap,
    this.height,
    this.width,
    this.backgroundColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.colorswhite.withOpacity(.3),
              shape: BoxShape.circle),
          child: Icon(
            icon,
            size: size,
            color: AppColors.primarycolors,
          )),
    );
  }
}
