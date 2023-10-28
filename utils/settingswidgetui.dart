import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class Settingwidgetui extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onTap;
  const Settingwidgetui(
      {super.key, required this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 23.0,
                color: AppColors.secondrycolors,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(title,
                  style: AppStyles.onboardsubtitle.copyWith(fontSize: 16.sp)),
            ],
          ),
          Spacer(),
          IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 23.0,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }
}
