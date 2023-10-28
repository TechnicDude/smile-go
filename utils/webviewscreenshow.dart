import 'package:flutter/material.dart';
import 'package:smile_and_go_app/utils/loaderscreennew.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreensShow extends StatefulWidget {
  final String url;
  const WebViewScreensShow({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreensShow> createState() => _WebViewScreensShowState();
}

class _WebViewScreensShowState extends State<WebViewScreensShow> {
  // var loadingPercentage = 0;
  // late final WebViewController _controller;
  // @override
  // void initState() {
  //   print(loadingPercentage);
  //   // TODO: implement initState
  //   _controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setBackgroundColor(const Color(0x00000000))
  //     ..setNavigationDelegate(
  //       NavigationDelegate(
  //         onProgress: (int progress) {
  //           setState(() {
  //             loadingPercentage = progress;
  //           });
  //         },
  //         onPageStarted: (String url) {
  //           setState(() {
  //             loadingPercentage = 0;
  //           });
  //         },
  //         onPageFinished: (String url) {
  //           // _controller.runJavaScript(javaScript);
  //           _controller.runJavaScript(
  //               "document.getElementsByTagName('header')[0].style.display='none'");
  //           _controller.runJavaScript(
  //               "document.getElementsByTagName('footer')[0].style.display='none'");
  //           setState(() {
  //             loadingPercentage = 100;
  //           });
  //         },
  //         onWebResourceError: (WebResourceError error) {},
  //       ),
  //     )
  //     ..loadRequest(Uri.parse(widget.url));
  //   super.initState();
  // }

  var loadingPercentage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(50), child: AppBarScreens()),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
          if (loadingPercentage < 100)
            Center(
              child: LoaderScreennew(
                  // value: loadingPercentage / 100.0,
                  ),
            ),
        ],
      ),
      // Stack(
      //   children: [
      //     WebViewWidget(controller: _controller),
      //     if (loadingPercentage < 100)
      //       Center(
      //         child: CircularProgressIndicator(
      //           value: loadingPercentage / 100.0,
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
