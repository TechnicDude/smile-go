import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/appstyles.dart';

class DialogHelper {
  static void hideLoading() {}

  static Future<void> showFlutterToast({required String strMsg}) async {
    await Fluttertoast.showToast(msg: strMsg);
  }
  shoppopDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          Languages.of(context)!.alert,
        ),
        content: Text(Languages.of(context)!.internetnotavailable,
            style: AppStyles.onboardbody.copyWith(fontSize: 15.sp)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              Languages.of(context)!.ok,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
