import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appcolors.dart';

class LoaderScreen extends StatelessWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 4.h,
        height: 4.h,
        child: const Center(
          child: CircularProgressIndicator(
            color: AppColors.secondrycolors,
          ),
        ),
      ),
    );
  }
}
