import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:webview_flutter/webview_flutter.dart' as web;
import 'constant_widget.dart';

class WebView extends StatelessWidget {
  WebView({Key? key, required this.title, required this.link}) : super(key: key);

  String link;
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.blueColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.whiteColor,
            )),
        title: RestInvestTitle(
          text: title,
          textColor: AppColor.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: web.WebView(
        initialUrl: link,
        javascriptMode: web.JavascriptMode.unrestricted,
      ),
    );
  }
}
