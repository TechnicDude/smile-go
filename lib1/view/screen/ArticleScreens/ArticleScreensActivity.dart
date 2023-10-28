import 'package:flutter/material.dart';
import 'package:smile_and_go_app/api/api.dart';
import 'package:smile_and_go_app/localization/Language/languages.dart';
import 'package:smile_and_go_app/utils/appbarforall.dart';
import 'package:smile_and_go_app/utils/webviewscreenshow.dart';

class ArticleScreenActivity extends StatefulWidget {
  const ArticleScreenActivity({super.key});

  @override
  State<ArticleScreenActivity> createState() => _ArticleScreenActivityState();
}

class _ArticleScreenActivityState extends State<ArticleScreenActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBarScreens(
            text: Languages.of(context)!.articles,
          ),
          preferredSize: Size(
              MediaQuery.of(context).size.width, AppBar().preferredSize.height),
        ),
        body: WebViewScreensShow(
          url: APIURL.articles,
        ));
  }
}
