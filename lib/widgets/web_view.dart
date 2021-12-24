import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investintrust/utils/colors.dart';
import 'package:webview_flutter/webview_flutter.dart' as web;
import 'constant_widget.dart';


class WebView extends StatefulWidget {
  WebView({Key? key, required this.title, required this.link}) : super(key: key);
  String link;
  String title;
  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  bool isLoading = true;
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
          text: widget.title,
          textColor: AppColor.whiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        children: <Widget>[
          web.WebView(
            initialUrl: widget.link,
            javascriptMode: web.JavascriptMode.unrestricted,
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          isLoading ? const Center( child: DialogBox(),)
              : Stack(),
        ],
      ),
      // web.WebView(
      //   initialUrl: widget.link,
      //   javascriptMode: web.JavascriptMode.unrestricted,
      // ),
    );
  }
}



// class WebView extends StatelessWidget {
//   WebView({Key? key, required this.title, required this.link}) : super(key: key);
//
//   String link;
//   String title;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.blueColor,
//         leading: IconButton(
//             onPressed: () {
//               Get.back();
//             },
//             icon: const Icon(
//               Icons.arrow_back,
//               color: AppColor.whiteColor,
//             )),
//         title: RestInvestTitle(
//           text: title,
//           textColor: AppColor.whiteColor,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       body: web.WebView(
//         initialUrl: link,
//         javascriptMode: web.JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
