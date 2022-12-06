import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UIWebView extends StatefulWidget {
  final String url;
  final String title;
  const UIWebView({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  UIWebViewState createState() => UIWebViewState();
}

class UIWebViewState extends State<UIWebView> {
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  bool isLoading = true;
  final _key = UniqueKey();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading
              ? Center(
                  child: Lottie.asset(
                    'assets/animations/location.json',
                  ),
                )
              : Stack(),
        ],
      ),
    );
  }
}
