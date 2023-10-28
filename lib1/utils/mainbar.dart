import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appimages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class MainBar extends StatelessWidget {
  final String? image;
  final String? text;
  final String? subtext;
  const MainBar({
    Key? key,
    this.image,
    this.text,
    this.subtext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 2.h,
        ),
        Center(
          child: Image.asset(
            image ?? '',
            width: 40.w,
            height: 30.w,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          text ?? '',
          style: AppStyles.onboardtitle.copyWith(fontSize: 18.sp),
        ),
        SizedBox(
          height: 4.h,
        ),
      ],
    );
  }
}
