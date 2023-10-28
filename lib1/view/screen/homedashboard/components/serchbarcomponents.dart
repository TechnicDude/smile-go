import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/page_routes/routes.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class SerchBarComponentsScreenActivity extends StatelessWidget {
  const SerchBarComponentsScreenActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.searchScreentActivity);
      },
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: AppColors.colortextgrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColors.colorgrey,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              Languages.of(context)!.search,
              style: AppStyles.onboardbody.copyWith(color: AppColors.colorgrey),
            )
          ],
        ),
      ),
    );
  }
}
