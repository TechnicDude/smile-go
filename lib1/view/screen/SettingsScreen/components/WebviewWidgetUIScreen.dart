import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/webviewscreenshow.dart';

class WebviewWidgetUIScreen extends StatefulWidget {
  final String url;
  final String text;

  const WebviewWidgetUIScreen({
    super.key,
    required this.text,
    required this.url,
  });

  @override
  State<WebviewWidgetUIScreen> createState() => _WebviewWidgetUIScreenState();
}

class _WebviewWidgetUIScreenState extends State<WebviewWidgetUIScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarScreens(text: widget.text)),
        body: WebViewScreensShow(url: widget.url));
  }
}
