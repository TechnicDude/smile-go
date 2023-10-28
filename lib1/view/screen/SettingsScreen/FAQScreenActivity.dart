import 'package:flutter/material.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/utils/webviewscreenshow.dart';

class FAQScreenActivity extends StatefulWidget {
  const FAQScreenActivity({super.key});

  @override
  State<FAQScreenActivity> createState() => _FAQScreenActivityState();
}

class _FAQScreenActivityState extends State<FAQScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return WebViewScreensShow(
      url: APIURL.contactus,
    );
  }
}
